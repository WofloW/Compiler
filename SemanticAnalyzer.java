import java.util.Vector;

public class SemanticAnalyzer implements ASTVisitor {
    private VariableEnvironment variableEnv;
    private FunctionEnvironment functionEnv;
    private TypeEnvironment typeEnv;
    private Type functionReturn;
    private AATBuildTree bt;
    private int offset;
    private Label functionEnd;
    public SemanticAnalyzer() {
        variableEnv = new VariableEnvironment();
        functionEnv = new FunctionEnvironment();
        functionEnv.addBuiltinFunctions();
        typeEnv = new TypeEnvironment();
        bt = new AATBuildTree();
        functionReturn = null;
        functionEnd = null;
    }

    public Object VisitArrayVariable(ASTArrayVariable array) {
        TypeClass baseResult = (TypeClass) array.base().Accept(this);
        Type baseType = baseResult.type();

        if (!(baseType instanceof ArrayType)) {
            CompError.message(array.line(), "Variable is not an array type");
            return new TypeClass(IntegerType.instance(), null);
        } else {
            TypeClass indexResult = (TypeClass) array.index().Accept(this);
            Type index = indexResult.type();
            if (index != IntegerType.instance()) {
                CompError.message(array.line(), "Array index must be an integer");
            }
            return new TypeClass( ((ArrayType)baseType).type(),
                                  bt.arrayVariable(baseResult.value(),
                                                   indexResult.value(), MachineDependent.WORDSIZE));
        }
    }

    public Object VisitAssignmentStatement(ASTAssignmentStatement assign) {
        TypeClass lhs = (TypeClass) assign.variable().Accept(this);
        Type lhsType = lhs.type();
        TypeClass rhs = (TypeClass) assign.value().Accept(this);
        Type rhsType = rhs.type();
        if (lhsType != rhsType) {
            CompError.message(assign.line(), "Types of lhs and rhs of AssignmentStatement must be the same");
        }
        return bt.assignmentStatement(lhs.value(),
                                      rhs.value());

    }

    public Object VisitBaseVariable(ASTBaseVariable base) {
        VariableEntry baseEntry = variableEnv.find(base.name());
        if (baseEntry == null) {
            CompError.message(base.line(), "Variable " + base.name() + " is not declared in this scope");
            return new TypeClass(IntegerType.instance(), null);
        } else {
            return new TypeClass( baseEntry.type(),
                                  bt.baseVariable(baseEntry.offset()));
        }
    }

    public Object VisitBooleanLiteral(ASTBooleanLiteral boolliteral) {
        int result;
        if (boolliteral.value() == false)
            result = 0;
        else
            result = 1;
        return new TypeClass( BooleanType.instance(),
                              bt.constantExpression(result));
    }

    public Object VisitClass(ASTClass classs) {
        offset = 0;
        VariableEntry baseEntry = variableEnv.find(classs.name());
        if (baseEntry != null) {
            CompError.message(classs.line(), "Class " + classs.name() + " is already defined");
            return null;
        }

        classs.variabledefs().Accept(this);

        Type tc;
        VariableEnvironment instanceVars = new VariableEnvironment();

        String varStepTypeName;
        Type varBaseType;
        Type varStepType;

        for (int i = 0; i < classs.variabledefs().size(); i++) {
            varStepTypeName = classs.variabledefs().elementAt(i).type();
            varBaseType = typeEnv.find(varStepTypeName);
            varStepType = varBaseType;

            for (int j = 0; j < classs.variabledefs().elementAt(i).arraydimension(); j++) {
                varStepTypeName = varStepTypeName + "[]";
                varStepType = typeEnv.find(varStepTypeName);
                if (varStepType == null) {
                    varStepType = new ArrayType(varBaseType);
                    typeEnv.insert(varStepTypeName, varStepType);
                }
                varBaseType = varStepType;
            }

            VariableEntry varEntry = new VariableEntry(varStepType, offset);
            offset += MachineDependent.WORDSIZE;
            instanceVars.insert(classs.variabledefs().elementAt(i).name(), varEntry);
        }
        tc = new ClassType(instanceVars);
        typeEnv.insert(classs.name(), tc);
        return null;
    }

    public Object VisitClasses(ASTClasses classes) {
        int i;
        for (i = 0; i < classes.size(); i++)
            classes.elementAt(i).Accept(this);
        return null;
    }

    public Object VisitClassVariable(ASTClassVariable classvariable) {
        TypeClass base = (TypeClass) classvariable.base().Accept(this);
        Type baseType = base.type();
        if (!(baseType instanceof ClassType)) {
            CompError.message(classvariable.line(), "Variable is not a class type");
            return new TypeClass(IntegerType.instance(), null);
        } else {

            VariableEntry variableEntry = ((ClassType) baseType).variables().find(classvariable.variable());
            if (variableEntry == null) {
                CompError.message(classvariable.line(), "ClassVariable doesn't have variable " + classvariable.variable());
                return new TypeClass(IntegerType.instance(), null);
            }
            return new TypeClass(variableEntry.type(),
                                 bt.classVariable(base.value(),
                                                  variableEntry.offset()));
        }

    }

    public Object VisitDoWhileStatement(ASTDoWhileStatement dowhile) {
        variableEnv.beginScope();
        AATStatement dowhilebody = (AATStatement) dowhile.body().Accept(this);

        TypeClass testResult = (TypeClass) dowhile.test().Accept(this);
        Type test = testResult.type();
        if (test != BooleanType.instance()) {
            CompError.message(dowhile.line(), "DoWhile test must be a boolean");
        }
        variableEnv.endScope();
        return bt.dowhileStatement(testResult.value(), dowhilebody);
    }

    public Object VisitEmptyStatement(ASTEmptyStatement empty) {
        return bt.emptyStatement();
    }

    public Object VisitForStatement(ASTForStatement forstmt) {
        variableEnv.beginScope();
        AATStatement init = (AATStatement) forstmt.initialize().Accept(this);
        TypeClass testResult = (TypeClass) forstmt.test().Accept(this);
        Type test = testResult.type();
        if (test != BooleanType.instance()) {
            CompError.message(forstmt.line(), "If test must be a boolean");
        }
        AATStatement increment = (AATStatement) forstmt.increment().Accept(this);
        AATStatement body = (AATStatement) forstmt.body().Accept(this);
        variableEnv.endScope();
        return bt.forStatement(init, testResult.value(), increment, body);
    }

    public Object VisitFormal(ASTFormal formal) {

        Type formalBaseType = typeEnv.find(formal.type());
        String formalStepTypeName = formal.type();
        Type formalStepType = formalBaseType;

        if (formalBaseType == null) {
            CompError.message(formal.line(), "Base type " + formal.type() + "of formal is not defined");
            return IntegerType.instance();
        } else {
            for (int i = 0; i < formal.arraydimension(); i++) {
                formalStepTypeName = formalStepTypeName + "[]";
                formalStepType = typeEnv.find(formalStepTypeName);
                if (formalStepType == null) {
                    formalStepType = new ArrayType(formalBaseType);
                    typeEnv.insert(formalStepTypeName, formalStepType);
                }
                formalBaseType = formalStepType;
            }

            return formalStepType;
        }
    }

    public Object VisitFormals(ASTFormals formals) {
        int i;
        Vector formalsV = new Vector(1);
        for (i = 0; i < formals.size(); i++) {
            Type formalType = (Type)formals.elementAt(i).Accept(this);
            formalsV.addElement(formalType);
            variableEnv.insert( formals.elementAt(i).name(),
                                new VariableEntry(formalType,
                                                  -(i+1) * MachineDependent.WORDSIZE));
        }
        return formalsV;
    }

    public Object VisitFunction(ASTFunction function) {
        offset = 0;
        variableEnv.beginScope();
        
        FunctionEntry func = functionEnv.find(function.name());
        if (func == null) {
            Label startlabel = new Label(function.name());
            Label endlabel = new Label(function.name() + "end");
            String functionTypeName;
            functionTypeName = function.type();
            Type functionType = typeEnv.find(functionTypeName);
            if (functionType == null) {
                CompError.message(function.line(), "Return type " + functionTypeName + " is not defined");
            } else {
                functionReturn = functionType;
                functionEnd = endlabel;
            }
            Vector formalsV = null;

            if (function.formals() != null)
                formalsV = (Vector) function.formals().Accept(this);
            functionEnv.insert(function.name(),
                               new FunctionEntry(functionType,
                                                 formalsV,
                                                 startlabel,
                                                 endlabel));
        } else {
            String functionTypeName = function.type();
            Type functionType = typeEnv.find(functionTypeName);
            if (functionType != func.result()) {
                CompError.message(function.line(), "Return type of " + function.name() + " is not same as prototype");
            } else {
                functionReturn = functionType;
                functionEnd = func.endlabel();
            }
            Vector formalsV = null;
            Vector formalsP = func.formals();
            if (function.formals() != null)
                formalsV = (Vector) function.formals().Accept(this);
            if (formalsV.size() != formalsP.size())
                CompError.message(function.line(), "Parameter number of " + function.name() + " is not same as prototype");
            else {
                for (int i = 0; i < formalsV.size(); i++) {
                    if (formalsV.elementAt(i) != formalsP.elementAt(i))
                        CompError.message(function.line(), "Type of #" + (i + 1) + " formal parameter is not same as prototype");
                }
            }

        }
        FunctionEntry samefunc = functionEnv.find(function.name());
        AATStatement body = (AATStatement) function.body().Accept(this);
        variableEnv.endScope();
        return bt.functionDefinition(body,
                                     offset + 12,
                                     samefunc.startlabel(),
                                     samefunc.endlabel());
    }

    public Object  VisitFunctionDefinitions(ASTFunctionDefinitions functiondefs) {
        int i;
        Vector statementseq = new Vector(1);
        for (i = 0; i < functiondefs.size() ; i++)
            statementseq.addElement((AATStatement) functiondefs.elementAt(i).Accept(this));
        AATStatement tree = (AATStatement)statementseq.elementAt(functiondefs.size() - 1);
        if (functiondefs.size() > 1) {
            for (i = functiondefs.size() - 2; i >= 0 ; i--)
                tree = new AATSequential((AATStatement)statementseq.elementAt(i), tree);
        }
        return tree;
    }

    public Object VisitFunctionCallExpression(ASTFunctionCallExpression functioncall) {
        FunctionEntry func = functionEnv.find(functioncall.name());
        if (func == null) {
            CompError.message(functioncall.line(), "Function " + functioncall.name() + " is not defined");
            return new TypeClass(IntegerType.instance(), null);
        }
        if (func.formals().size() != functioncall.size()) {
            CompError.message(functioncall.line(), "Number of formal parameters of function call expression is not correct");
            return new TypeClass(IntegerType.instance(), null);
        }
        Vector inputFormal = new Vector(1);
        for (int i = 0; i < functioncall.size(); i++) {
            Type formalT = (Type) func.formals().elementAt(i);
            TypeClass inputTResult = (TypeClass) functioncall.elementAt(i).Accept(this);
            Type inputT = inputTResult.type();
            if (formalT != inputT) {
                CompError.message(functioncall.line(), "Type of #" + (i + 1) + " formal parameter is not matched");
                return new TypeClass(IntegerType.instance(), null);
            }
            inputFormal.addElement(inputTResult.value());
        }
        return new TypeClass(func.result(),
                             bt.callExpression(inputFormal,
                                               func.startlabel()));
    }

    public Object VisitFunctionCallStatement(ASTFunctionCallStatement functioncall) {
        FunctionEntry func = functionEnv.find(functioncall.name());
        if (func == null) {
            CompError.message(functioncall.line(), "Function " + functioncall.name() + " is not defined");
            return bt.emptyStatement();
        }
        if (func.formals().size() != functioncall.size()) {
            CompError.message(functioncall.line(), "Number of formal parameters of function call statement is not correct");
            return bt.emptyStatement();
        }
        Vector inputFormal = new Vector(1);
        for (int i = 0; i < functioncall.size(); i++) {
            Type formalT = (Type) func.formals().elementAt(i);
            TypeClass inputTResult = (TypeClass) functioncall.elementAt(i).Accept(this);
            Type inputT = inputTResult.type();
            if (formalT != inputT) {
                CompError.message(functioncall.line(), "Type of #" + (i + 1) + " formal parameter is not matched");
                return bt.emptyStatement();
            }
            inputFormal.addElement(inputTResult.value());
        }
        if (func.result() != VoidType.instance())
            CompError.message(functioncall.line(), "Function " + functioncall.name() + " not a void function");
        return bt.callStatement(inputFormal,
                                func.startlabel());
    }

    public Object VisitIfStatement(ASTIfStatement ifsmt) {
        TypeClass testResult = (TypeClass) ifsmt.test().Accept(this);
        Type test = testResult.type();
        if (test != BooleanType.instance()) {
            CompError.message(ifsmt.line(), "If test must be a boolean");
        }
        variableEnv.beginScope();
        AATStatement ifbody = (AATStatement) ifsmt.thenstatement().Accept(this);
        variableEnv.endScope();
        AATStatement elsebody = bt.emptyStatement();
        if (ifsmt.elsestatement() != null) {
            variableEnv.beginScope();
            elsebody = (AATStatement) ifsmt.elsestatement().Accept(this);
            variableEnv.endScope();
        }
        return bt.ifStatement(testResult.value(),
                              ifbody,
                              elsebody);
    }

    public Object VisitIntegerLiteral(ASTIntegerLiteral literal) {
        return new TypeClass(IntegerType.instance(),
                             bt.constantExpression(literal.value()));
    }

    public Object VisitNewArrayExpression(ASTNewArrayExpression newarray) {
        String varStepTypeName = newarray.type();
        Type varBaseType = typeEnv.find(varStepTypeName);
        Type varStepType = varBaseType;

        if (varBaseType == null) {
            CompError.message(newarray.line(), "Base type " + varStepTypeName + " is not defined");
            return new TypeClass(IntegerType.instance(), null);
        } else {
            for (int i = 0; i < newarray.arraydimension(); i++) {
                varStepTypeName = varStepTypeName + "[]";
                varStepType = typeEnv.find(varStepTypeName);
                if (varStepType == null) {
                    varStepType = new ArrayType(varBaseType);
                    typeEnv.insert(varStepTypeName, varStepType);
                }
                varBaseType = varStepType;
            }

            TypeClass indexResult = (TypeClass) newarray.elements().Accept(this);
            Type index = indexResult.type();
            if (index != IntegerType.instance()) {
                CompError.message(newarray.line(), "Array index must be an integer");
            }

            return new TypeClass(varStepType,
                                 bt.allocate(bt.operatorExpression(indexResult.value(), bt.constantExpression(MachineDependent.WORDSIZE),  AATOperator.MULTIPLY) ));
        }
    }

    public Object VisitNewClassExpression(ASTNewClassExpression newclass) {
        Type classType = typeEnv.find(newclass.type());
        if (classType == null) {
            CompError.message(newclass.line(), "Class " + newclass.type() + " is not defined");
            return new TypeClass(IntegerType.instance(), null);
        }
        return new TypeClass (classType,
                              bt.allocate( bt.constantExpression(((ClassType)classType).variables().size() * MachineDependent.WORDSIZE)) );
    }

    public Object VisitOperatorExpression(ASTOperatorExpression opexpr) {

        TypeClass lhs = (TypeClass) opexpr.left().Accept(this);
        TypeClass rhs = (TypeClass) opexpr.right().Accept(this);

        AATExpression leftv = lhs.value();
        AATExpression rightv = rhs.value();
        Type lhsType = lhs.type();
        Type rhsType = rhs.type();

        if (opexpr.operator() <= 4) {
            if (lhsType != IntegerType.instance())
                CompError.message(opexpr.line(), "Type of lhs of " + opexpr.names[opexpr.operator()] + " must be an integer");
            if (rhsType != IntegerType.instance())
                CompError.message(opexpr.line(), "Type of rhs of " + opexpr.names[opexpr.operator()] + " must be an integer");
            return new TypeClass(IntegerType.instance(),
                                 bt.operatorExpression(leftv, rightv, opexpr.operator()));
        } else if (opexpr.operator() >= 7) {
            if (lhsType != IntegerType.instance())
                CompError.message(opexpr.line(), "Type of lhs of " + opexpr.names[opexpr.operator()] + " must be an integer");
            if (rhsType != IntegerType.instance())
                CompError.message(opexpr.line(), "Type of rhs of " + opexpr.names[opexpr.operator()] + " must be an integer");
            return new TypeClass(BooleanType.instance(),
                                 bt.operatorExpression(leftv, rightv, opexpr.operator()));
        } else {
            if (lhsType != BooleanType.instance())
                CompError.message(opexpr.line(), "Type of lhs of " + opexpr.names[opexpr.operator()] + " must be an boolean");
            if (rhsType != BooleanType.instance())
                CompError.message(opexpr.line(), "Type of rhs of " + opexpr.names[opexpr.operator()] + " must be an boolean");
            return new TypeClass(BooleanType.instance(),
                                 bt.operatorExpression(leftv, rightv, opexpr.operator()));
        }

    }

    public Object VisitProgram(ASTProgram program) {
        program.classes().Accept(this);
        AATStatement statements = (AATStatement) program.functiondefinitions().Accept(this);
        return statements;
    }

    public Object VisitPrototype(ASTPrototype prototype) {
        FunctionEntry func = functionEnv.find(prototype.name());
        if (func != null) {
            CompError.message(prototype.line(), "Prototype " + prototype.name() + " is already defined");
            return bt.emptyStatement();
        }
        variableEnv.beginScope();
        Type prototypeRetType = typeEnv.find(prototype.type());
        if (prototypeRetType == null) {
            CompError.message(prototype.line(), "Return type of " + prototype.type() + " is not defined");
        }
        Vector formalsV = null;
        if (prototype.formals() != null)
            formalsV = (Vector) prototype.formals().Accept(this);
        Label startlabel = new Label(prototype.name());
        Label endlabel = new Label(prototype.name() + "end");
        functionEnv.insert(prototype.name(), new FunctionEntry(prototypeRetType, formalsV, startlabel, endlabel));
        variableEnv.endScope();
        return bt.emptyStatement();

    }

    public Object VisitReturnStatement(ASTReturnStatement ret) {

        Type retType = VoidType.instance();
        AATExpression retValue = null;
        if (ret.value() != null) {
            TypeClass retResult = (TypeClass) ret.value().Accept(this);
            retType = retResult.type();
            retValue = retResult.value();
        }
        if (functionReturn != retType)
            CompError.message(ret.line(), "Return type doesn't match");
        return bt.returnStatement(retValue,
                                  functionEnd);
    }

    public Object VisitStatements(ASTStatements statements) {
        variableEnv.beginScope();
        Vector statementseq = new Vector(1);
        int i;
        for (i = 0; i < statements.size() ; i++)
            statementseq.addElement((AATStatement) statements.elementAt(i).Accept(this));
        AATStatement tree = bt.emptyStatement();
        //System.out.println(statements.size());
        if (statements.size() != 0)
            tree = (AATStatement)statementseq.elementAt(statements.size() - 1);
        if (statements.size() > 1) {
            for (i = statements.size() - 2; i >= 0 ; i--)
                tree = new AATSequential((AATStatement)statementseq.elementAt(i), tree);
        }
        variableEnv.endScope();
        return tree;
    }

    public Object VisitUnaryOperatorExpression(ASTUnaryOperatorExpression operator) {
        TypeClass operandResult = (TypeClass) operator.operand().Accept(this);
        Type operand = operandResult.type();
        if (operand != BooleanType.instance()) {
            CompError.message(operator.line(), "Unary operator expression must be a boolean");
        }
        return new TypeClass (BooleanType.instance(),
                              bt.operatorExpression(operandResult.value(), bt.constantExpression(0), AATOperator.NOT));
    }

    public Object VisitInstanceVariableDef(ASTInstanceVariableDef variabledef) {
        Type varBaseType = typeEnv.find(variabledef.type());
        String varStepTypeName = variabledef.type();
        Type varStepType;

        if (varBaseType == null) {
            CompError.message(variabledef.line(), "Base type " + variabledef.type() + " is not defined");
            return null;
        } else {
            for (int i = 0; i < variabledef.arraydimension(); i++) {
                varStepTypeName = varStepTypeName + "[]";
                varStepType = typeEnv.find(varStepTypeName);
                if (varStepType == null) {
                    varStepType = new ArrayType(varBaseType);
                    typeEnv.insert(varStepTypeName, varStepType);
                }
                varBaseType = varStepType;
            }
        }

        return null;
    }

    public Object VisitInstanceVariableDefs(ASTInstanceVariableDefs variabledefs) {
        int i;
        for (i = 0; i < variabledefs.size(); i++) {
            variabledefs.elementAt(i).Accept(this);
        }
        return null;
    }

    public Object VisitVariableExpression(ASTVariableExpression variableexpression) {
        TypeClass varExp = (TypeClass) variableexpression.variable().Accept(this);
        return varExp;
    }

    public Object VisitWhileStatement(ASTWhileStatement whilestatement) {
        TypeClass testResult = (TypeClass) whilestatement.test().Accept(this);
        Type test = testResult.type();

        if (test != BooleanType.instance()) {
            CompError.message(whilestatement.line(), "While test must be a boolean");
        }
        AATStatement whilebody = (AATStatement) whilestatement.body().Accept(this);
        return bt.whileStatement(testResult.value(),
                                 whilebody);

    }

    public Object VisitVariableDefStatement(ASTVariableDefStatement variabledef) {
        String varStepTypeName = variabledef.type();
        Type varBaseType = typeEnv.find(varStepTypeName);
        Type varStepType = varBaseType;

        VariableEntry baseEntry = variableEnv.find(variabledef.name());
        if (baseEntry != null) {
            CompError.message(variabledef.line(), "Variable " + variabledef.name() + " is already declared");
            return bt.emptyStatement();
        }

        if (varBaseType == null) {
            CompError.message(variabledef.line(), "Base type " + varStepTypeName + " is not defined");
            return bt.emptyStatement();
        }

        for (int i = 0; i < variabledef.arraydimension(); i++) {
            varStepTypeName = varStepTypeName + "[]";
            varStepType = typeEnv.find(varStepTypeName);
            if (varStepType == null) {
                varStepType = new ArrayType(varBaseType);
                typeEnv.insert(varStepTypeName, varStepType);
            }
            varBaseType = varStepType;
        }

        variableEnv.insert(variabledef.name(), new VariableEntry(varStepType, offset));
        offset += MachineDependent.WORDSIZE;

        if (variabledef.init() != null) {
            TypeClass init = (TypeClass) variabledef.init().Accept(this);
            Type initType = init.type();
            if (initType != varStepType) {
                CompError.message(variabledef.line(), "Type of variable initialization of " + variabledef.name() + " is not matched");
                return bt.emptyStatement();
            }
            return bt.assignmentStatement(bt.baseVariable(offset - MachineDependent.WORDSIZE),
                                          init.value());
        }
        return bt.emptyStatement();

    }

}

