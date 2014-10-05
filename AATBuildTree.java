import java.util.Vector;

public class AATBuildTree {

    public AATStatement functionDefinition(AATStatement body, int framesize, Label start,
                                           Label end) {
        AATStatement storeSP = new AATMove(new AATMemory(new AATOperator(new AATRegister(Register.SP()),
                                           new AATConstant(framesize - 12),
                                           AATOperator.MINUS)),
                                           new AATRegister(Register.SP()));
        AATStatement storeFP = new AATMove(new AATMemory(new AATOperator(new AATRegister(Register.SP()),
                                           new AATConstant(framesize - 8),
                                           AATOperator.MINUS)),
                                           new AATRegister(Register.FP()));
        AATStatement storeRA = new AATMove(new AATMemory(new AATOperator(new AATRegister(Register.SP()),
                                           new AATConstant(framesize - 4),
                                           AATOperator.MINUS)),
                                           new AATRegister(Register.ReturnAddr()));


        AATStatement pointFP = new AATMove(new AATRegister(Register.FP()),
                                           new AATRegister(Register.SP()));
        AATStatement pointSP = new AATMove(new AATRegister(Register.SP()),
                                           new AATOperator(new AATRegister(Register.SP()),
                                                   new AATConstant(framesize),
                                                   AATOperator.MINUS));
        AATStatement setup = new AATSequential(pointFP, pointSP);
        setup = new AATSequential(storeRA, setup);
        setup = new AATSequential(storeFP, setup);
        setup = new AATSequential(storeSP, setup);


        AATStatement restoreFP = new AATMove(new AATRegister(Register.FP()),
                                             new AATMemory(new AATOperator(new AATRegister(Register.SP()),
                                                     new AATConstant(-8),
                                                     AATOperator.MINUS)));
        AATStatement restoreRA = new AATMove(new AATRegister(Register.ReturnAddr()),
                                             new AATMemory(new AATOperator(new AATRegister(Register.SP()),
                                                     new AATConstant(-4),
                                                     AATOperator.MINUS)));
        AATStatement restoreSP = new AATMove(new AATRegister(Register.SP()),
                                             new AATMemory(new AATOperator(new AATRegister(Register.SP()),
                                                     new AATConstant(-12),
                                                     AATOperator.MINUS)));

        AATStatement cleanup = new AATSequential(restoreRA, restoreSP);
        cleanup = new AATSequential(restoreFP, cleanup);


        AATStatement tree = new AATSequential(cleanup, new AATReturn());
        tree = new AATSequential(new AATLabel(end), tree);
        tree = new AATSequential(body, tree);
        tree = new AATSequential(setup, tree);
        tree = new AATSequential(new AATLabel(start), tree);
        return tree;
    }

    public AATStatement ifStatement(AATExpression test, AATStatement ifbody, AATStatement elsebody) {
        Label trueLab = new Label("iftrue");
        Label endLab = new Label("ifend");

        AATStatement jump = new AATConditionalJump(test, trueLab);
        AATStatement tree = new AATSequential(ifbody, new AATLabel(endLab));
        tree = new AATSequential(new AATLabel(trueLab), tree);
        tree = new AATSequential(new AATJump(endLab), tree);
        tree = new AATSequential(elsebody, tree);
        tree = new AATSequential(jump, tree);
        return tree;
    }

    public AATExpression allocate(AATExpression size) {
        Vector actuals = new Vector(1);
        actuals.addElement(size);
        return new AATCallExpression(Label.AbsLabel("allocate"), actuals);
    }

    public AATStatement whileStatement(AATExpression test, AATStatement whilebody) {
        Label startLab = new Label("whilestart");
        Label testLab = new Label("whiletest");

        AATStatement jumpTest = new AATJump(testLab);
        AATStatement jumpStart = new AATConditionalJump(test, startLab);
        AATStatement tree = new AATSequential(new AATLabel(testLab), jumpStart);
        tree = new AATSequential(whilebody, tree);
        tree = new AATSequential(new AATLabel(startLab), tree);
        tree = new AATSequential(jumpTest, tree);
        return tree;
    }

    public AATStatement dowhileStatement(AATExpression test, AATStatement dowhilebody) {
        Label startLab = new Label("whilestart");
        AATStatement jumpStart = new AATConditionalJump(test, startLab);

        AATStatement tree = new AATSequential(dowhilebody, jumpStart);
        tree = new AATSequential(new AATLabel(startLab), tree);
        return tree;
    }

    public AATStatement forStatement(AATStatement init, AATExpression test,
                                     AATStatement increment, AATStatement body) {
        Label startLab = new Label("forstart");
        Label testLab = new Label("fortest");
        AATStatement jumpTest = new AATJump(testLab);
        AATStatement jumpStart = new AATConditionalJump(test, startLab);

        AATStatement tree = new AATSequential(new AATLabel(testLab), jumpStart);
        tree = new AATSequential(increment, tree);
        tree = new AATSequential(body, tree);
        tree = new AATSequential(new AATLabel(startLab), tree);
        tree = new AATSequential(jumpTest, tree);
        tree = new AATSequential(init, tree);
        return tree;
    }

    public AATStatement emptyStatement() {
        return new AATEmpty();
    }

    public AATStatement callStatement(Vector actuals, Label name) {
        return new AATCallStatement(name, actuals);
    }

    public AATStatement assignmentStatement(AATExpression lhs,
                                            AATExpression rhs) {
        return new AATMove(lhs, rhs);
    }

    public AATStatement sequentialStatement(AATStatement first,
                                            AATStatement second) {
        return new AATSequential(first, second);
    }

    public AATExpression baseVariable(int offset) {
        return new AATMemory(new AATOperator(new AATRegister(Register.FP()),
                                             new AATConstant(offset),
                                             AATOperator.MINUS)) ;        //offset is negative
    }

    public AATExpression arrayVariable(AATExpression base,
                                       AATExpression index,
                                       int elementSize) {
        return new AATMemory(new AATOperator(base,
                                             new AATOperator(index,
                                                     new AATConstant(elementSize),
                                                     AATOperator.MULTIPLY),
                                             AATOperator.MINUS));
    }

    public AATExpression classVariable(AATExpression base, int offset) {
        return new AATMemory(new AATOperator(base,
                                             new AATConstant(offset),
                                             AATOperator.MINUS)) ;
    }

    public AATExpression constantExpression(int value) {
        return new AATConstant(value);
    }

    public AATExpression operatorExpression(AATExpression left,
                                            AATExpression right,
                                            int operator) {
        return new AATOperator(left,
                               right,
                               operator);
    }

    public AATExpression callExpression(Vector actuals, Label name) {
        return new AATCallExpression(name, actuals);
    }

    public AATStatement returnStatement(AATExpression value, Label functionend) {
        if (value == null)
            value = constantExpression(0);
        return new AATSequential(new AATMove(new AATRegister(Register.Result()), value),
                                 new AATJump(functionend));
    }
}

