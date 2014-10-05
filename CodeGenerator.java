import java.io.*;
import java.util.Vector;

class CodeGenerator implements AATVisitor { 
    
    public CodeGenerator(String output_filename) {
    try {
        output = new PrintWriter(new FileOutputStream(output_filename));
    } catch (IOException e) {
        System.out.println("Could not open file "+output_filename+" for writing.");
    }
    /*  Feel free to add code here, if you want to */
    EmitSetupCode();
    }
  
    public Object VisitCallExpression(AATCallExpression expression) { 
        Vector v = expression.actuals();

        for (int i = expression.actuals().size() - 1 ;i >= 0 ;i--) {
            if (v.elementAt(i) instanceof AATCallExpression) {
                VisitCallExpression((AATCallExpression)v.elementAt(i));
            } else if (v.elementAt(i) instanceof AATConstant) {
                VisitConstant((AATConstant)v.elementAt(i));
            } else if (v.elementAt(i) instanceof AATMemory) {
                VisitMemory((AATMemory)v.elementAt(i));
            } else if (v.elementAt(i) instanceof AATOperator) {
                VisitOperator((AATOperator)v.elementAt(i));
            }
            emit("sw " + Register.ACC() + ", " + 0 +"(" + Register.SP() + ")");
            emit("addi " + Register.SP() + ", " +Register.SP() + ", -" + MachineDependent.WORDSIZE);
        }
        emit("jal " + expression.label());
        emit("addi " + Register.SP() + ", " +Register.SP() + ", " + MachineDependent.WORDSIZE*expression.actuals().size());
        emit("addi " + Register.ACC() + ", " + Register.Result() + ", " + 0);
        return null;
    }
  
    public Object VisitMemory(AATMemory expression) { 
        expression.mem().Accept(this);
        emit("lw " + Register.ACC() + ", 0(" + Register.ACC() +")");
        return null;
    }
    
    
    public Object VisitOperator(AATOperator expression) { 
        if (expression.right() instanceof AATConstant && expression.operator() == AATOperator.PLUS)
        {
           expression.left().Accept(this);
           emit("addi " + Register.ACC() + ", " + Register.ACC() + ", " + ((AATConstant)expression.right()).value());
           return null;
        }
        if (expression.right() instanceof AATConstant && expression.operator() == AATOperator.MINUS)
        {
           expression.left().Accept(this);
           int val = -((AATConstant)expression.right()).value();
           emit("addi " + Register.ACC() + ", " + Register.ACC() + ", " + val);
           return null;
        }
        expression.left().Accept(this);
        emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");
        emit("addi " + Register.ESP() + ", " +Register.ESP() + ", -" + MachineDependent.WORDSIZE);
        expression.right().Accept(this);
        emit("addi " + Register.ESP() + ", " + Register.ESP() + ", " + MachineDependent.WORDSIZE);
        emit("lw " + Register.Tmp1() + ", 0(" + Register.ESP() +")");

        switch (expression.operator())
        {
        case AATOperator.PLUS:
            emit("add " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
            break;
        case AATOperator.MINUS:
            emit("sub " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
            break;
        case AATOperator.MULTIPLY:
            emit("mult " + Register.Tmp1() + ", " + Register.ACC());
            emit("mflo " + Register.ACC());
            break;
        case AATOperator.DIVIDE:
            emit("div " + Register.Tmp1() + ", " + Register.ACC());
            emit("mflo " + Register.ACC());
            break;
        case AATOperator.AND:
            emit("mult " + Register.Tmp1() + ", " + Register.ACC());
            emit("mflo " + Register.ACC());
            break;
        case AATOperator.OR:
            emit("add " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());       //use 0 for false, non-Zero for true
            break;
        case AATOperator.EQUAL:
            Label trueLab = new Label("truelab");
            Label endLab = new Label("endlab");
            emit("beq " + Register.Tmp1() + ", " + Register.ACC() + ", " + trueLab.toString());
            emit("addi " + Register.ACC() + ", " + Register.Zero() + ", " + 0);
            emit("j " + endLab.toString());
            emit(trueLab.toString() + ":");
            emit("addi " + Register.ACC() + ", " + Register.Zero() + ", " + 1);
            emit(endLab.toString() + ":");
            break;
        case AATOperator.NOT_EQUAL:
            Label trueLab2 = new Label("truelab");
            Label endLab2 = new Label("endlab");
            emit("bne " + Register.Tmp1() + ", " + Register.ACC() + ", " + trueLab2.toString());
            emit("addi " + Register.ACC() + ", " + Register.Zero() + ", " + 0);
            emit("j " + endLab2.toString());
            emit(trueLab2.toString() + ":");
            emit("addi " + Register.ACC() + ", " + Register.Zero() + ", " + 1);
            emit(endLab2.toString() + ":");
            break;
        case AATOperator.LESS_THAN:
            emit("slt " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
            break;
        case AATOperator.LESS_THAN_EQUAL:
            emit("addi " + Register.ACC() + ", " + Register.ACC() + ", " + 1);
            emit("slt " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
            break;
        case AATOperator.GREATER_THAN:
            emit("slt " + Register.ACC() + ", " + Register.ACC() + ", " + Register.Tmp1());
            break;
        case AATOperator.GREATER_THAN_EQUAL:
            emit("addi " + Register.Tmp1() + ", " + Register.Tmp1() + ", " + 1);
            emit("slt " + Register.ACC() + ", " + Register.ACC() + ", " + Register.Tmp1());
            break;
        case AATOperator.NOT:
            emit("addi " + Register.ACC() + ", " + Register.Zero() + ", " + 1);
            emit("slt " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
            break;
        }
        return null;
    }

    public Object VisitRegister(AATRegister expression) { 
        emit("add " + Register.ACC() + ", " + expression.register() + ", " + Register.Zero());
        return null;
    }
    
    public Object VisitCallStatement(AATCallStatement statement) {
        Vector v = statement.actuals();
        for (int i = statement.actuals().size() - 1 ;i >= 0 ;i--) {
            if (v.elementAt(i) instanceof AATCallExpression) {
                VisitCallExpression((AATCallExpression)v.elementAt(i));
            } else if (v.elementAt(i) instanceof AATConstant) {
                VisitConstant((AATConstant)v.elementAt(i));
            } else if (v.elementAt(i) instanceof AATMemory) {
                VisitMemory((AATMemory)v.elementAt(i));
            } else if (v.elementAt(i) instanceof AATOperator) {
                VisitOperator((AATOperator)v.elementAt(i));
            }
            emit("sw " + Register.ACC() + ", " + 0 +"(" + Register.SP() + ")");
            emit("addi " + Register.SP() + ", " +Register.SP() + ", -" + MachineDependent.WORDSIZE);
        }
        emit("jal " + statement.label());
        emit("addi " + Register.SP() + ", " +Register.SP() + ", " + MachineDependent.WORDSIZE*statement.actuals().size());

        return null;
    }
    
    public Object VisitConditionalJump(AATConditionalJump statement) {
        if (statement.test() instanceof AATOperator)
        {
            if( ((AATOperator)statement.test()).operator() == 7 )
            {
                ((AATOperator)statement.test()).left().Accept(this);
                emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");
                emit("addi " + Register.ESP() + ", " + Register.ESP() + ", -" + MachineDependent.WORDSIZE);
                ((AATOperator)statement.test()).right().Accept(this);
                emit("addi " + Register.ESP() + ", " + Register.ESP() + ", " + MachineDependent.WORDSIZE);
                emit("lw " + Register.Tmp1() + ", 0(" + Register.ESP() +")");
                emit("beq " + Register.Tmp1() + ", " + Register.ACC() + ", " + statement.label().toString());
                return null;
            }
            else if ( ((AATOperator)statement.test()).operator() == 9 &&
                        ((AATOperator)statement.test()).right() instanceof AATConstant) 
            {
                if( ((AATConstant) ((AATOperator)statement.test()).right()).value() == 0 )
                {
                    ((AATOperator)statement.test()).left().Accept(this);
                    emit("bltz " + Register.ACC() + ", " + statement.label().toString());
                    return null;
                }
            }
        }
        statement.test().Accept(this);
        emit("bgtz " + Register.ACC() + ", " + statement.label().toString());
        return null;
    }
    
    public Object VisitEmpty(AATEmpty statement) {
        return null;
    }
    public Object VisitJump(AATJump statement) {
    emit("j " + statement.label());
    return null;
    }
    public Object VisitLabel(AATLabel statement) {
    emit(statement.label() + ":");
    return null;
    }
    public Object VisitMove(AATMove statement) {
        if(statement.lhs() instanceof AATMemory)    //move-memory
        {
           if( ((AATMemory)statement.lhs()).mem() instanceof AATOperator)   //move-l(memory)-operator
            {
                if ( ((AATOperator) ((AATMemory)statement.lhs()).mem()).operator() == 1
                        ||  ((AATOperator) ((AATMemory)statement.lhs()).mem()).operator() == 2) //move-l(memory)-(+/-)
                {
                    if( ((AATOperator) ((AATMemory)statement.lhs()).mem()).right() instanceof AATConstant) //move-l(memory)-(+/-)-r(constant)
                    {
                        if( ((AATOperator) ((AATMemory)statement.lhs()).mem()).left() instanceof AATRegister)//move-l(memory)-(+/-)-l(register)-r(constant)
                        {
                            if (statement.rhs() instanceof AATRegister) //move-l(memory)-r(register)-(+/-)-l(register)-r(constant)
                            {
                                int val = ((AATConstant)((AATOperator) ((AATMemory)statement.lhs()).mem()).right()).value();
                                if( ((AATOperator) ((AATMemory)statement.lhs()).mem()).operator() == 2)
                                    val = -val;
                                emit("sw " + ((AATRegister)statement.rhs()).register() +
                                        ", " + val +"(" + ((AATRegister)((AATOperator) ((AATMemory)statement.lhs()).mem()).left()).register() + ")");
                                return null;
                            }
                            else
                            {
                                statement.rhs().Accept(this);
                                int val = ((AATConstant)((AATOperator) ((AATMemory)statement.lhs()).mem()).right()).value();
                                if( ((AATOperator) ((AATMemory)statement.lhs()).mem()).operator() == 2)
                                    val = -val;
                                emit("sw " + Register.ACC() + ", " + val +"(" + ((AATRegister)((AATOperator) ((AATMemory)statement.lhs()).mem()).left()).register() + ")");
                                return null;
                            }
                        }
                        else
                        {
                            ((AATOperator) ((AATMemory)statement.lhs()).mem()).left().Accept(this);
                            emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");
                            emit("addi " + Register.ESP() + ", " + Register.ESP() + ", -" + MachineDependent.WORDSIZE);
                            statement.rhs().Accept(this);
                            emit("addi " + Register.ESP() + ", " + Register.ESP() + ", " + MachineDependent.WORDSIZE);
                            emit("lw " + Register.Tmp1() + ", 0(" + Register.ESP() +")");
                            int val = ((AATConstant)((AATOperator) ((AATMemory)statement.lhs()).mem()).right()).value();
                            if( ((AATOperator) ((AATMemory)statement.lhs()).mem()).operator() == 2)
                                val = -val;
                            emit("sw " + Register.ACC() + ", " + val +"(" + Register.Tmp1() + ")");
                            return null;
                        }

                    }
                }
            }
            if (statement.rhs() instanceof AATRegister)
            {
                ((AATMemory)statement.lhs()).mem().Accept(this);
                emit("sw " + ((AATRegister)statement.rhs()).register() + ", 0(" + Register.ACC() + ")");
                return null;
            }           
            else
            {
                ((AATMemory)statement.lhs()).mem().Accept(this);
                emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");
                emit("addi " + Register.ESP() + ", " + Register.ESP() + ", -" + MachineDependent.WORDSIZE);
                statement.rhs().Accept(this);
                emit("addi " + Register.ESP() + ", " + Register.ESP() + ", " + MachineDependent.WORDSIZE);
                emit("lw " + Register.Tmp1() + ", 0(" + Register.ESP() +")");
                emit("sw " + Register.ACC() + ", 0(" + Register.Tmp1() + ")");
                return null;
            } 
        }
        else if (statement.lhs() instanceof AATRegister)
        {
            statement.rhs().Accept(this);
            emit("addi " + ((AATRegister)statement.lhs()).register() + ", " + Register.ACC() + ", 0");
            return null;
        }

       
        return null;
    }
    public Object VisitReturn(AATReturn statement) {
       emit("jr " + Register.ReturnAddr());
    return null;
    }

    public Object VisitHalt(AATHalt halt) {
    /* Don't need to implement halt -- you can leave 
       this as it is, if you like */
    return null;
    }
    public Object VisitSequential(AATSequential statement) {
        statement.left().Accept(this);
        statement.right().Accept(this);
        return null;
    }
    
    public Object VisitConstant(AATConstant expression) {
        emit("addi " + Register.ACC() + ", " + Register.Zero() + ", " + expression.value());
        return null;
    }
    
    private void emit(String assem) {
    assem = assem.trim();
    if (assem.charAt(assem.length()-1) == ':') 
      output.println(assem);
    else
        output.println("\t" + assem);
    }
    
    public void GenerateLibrary() {
    emit("Print:");
    emit("lw $a0, 4(" + Register.SP() + ")");
    emit("li $v0, 1");
    emit("syscall");
    emit("li $v0,4");
    emit("la $a0, sp");
    emit("syscall");
    emit("jr $ra");
    emit("Println:");
    emit("li $v0,4");
    emit("la $a0, cr");
    emit("syscall");
    emit("jr $ra");
    emit("Read:");
    emit("li $v0,5");
    emit("syscall");
    emit("jr $ra");
    emit("allocate:");
    emit("la " + Register.Tmp1() + ", HEAPPTR");
    emit("lw " + Register.Result() + ",0(" + Register.Tmp1() + ")");
    emit("lw " + Register.Tmp2() + ", 4(" + Register.SP() + ")");
    emit("sub " + Register.Tmp2() + ", " + Register.Result() + ", " + Register.Tmp2());
    emit("sw " + Register.Tmp2() + ",0(" + Register.Tmp1() + ")");
    emit("jr $ra");
    emit(".data");
    emit("cr:");
    emit(".asciiz \"\\n\"");
    emit("sp:");
    emit(".asciiz \" \"");
        emit("HEAPPTR:");
    emit(".word 0");
    output.flush();
    }
    
    private void EmitSetupCode() {
    emit(".globl main");
    emit("main:");
    emit("addi " + Register.ESP() + ", " + Register.SP() + ",0");
    emit("addi " + Register.SP() + ", " + Register.SP() + ", " + 
         - MachineDependent.WORDSIZE * STACKSIZE);
    emit("addi " + Register.Tmp1() + ", " + Register.SP() + ",0");
    emit("addi " + Register.Tmp1() + ", " + Register.Tmp1() + ", " + 
         - MachineDependent.WORDSIZE * STACKSIZE);
    emit("la " + Register.Tmp2() + ", HEAPPTR");
    emit("sw " + Register.Tmp1() + ",0(" + Register.Tmp2() + ")");
        emit("sw " + Register.ReturnAddr() + ", " + MachineDependent.WORDSIZE  + "("+ Register.SP() + ")"); 
    emit("jal main1");
    emit("li $v0, 10");
        emit("syscall");
    }
    
    private final int STACKSIZE = 1000;
    private PrintWriter output;
    /* Feel Free to add more instance variables, if you like */
}

