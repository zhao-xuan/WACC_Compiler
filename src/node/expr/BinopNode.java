package node.expr;

import type.BasicType;
import type.BasicTypeEnum;
import type.Type;
import utils.SymbolTable;



public class BinopNode extends ExprNode {

    public enum Binop {
        PLUS, MINUS, MUL, DIV, MOD, GREATER, GREATER_EQUAL, LESS, LESS_EQUAL, EQUAL, INEQUAL, AND, OR
    }
    
    private ExprNode expr1;
    private ExprNode expr2;
    private Binop operator;

    public BinopNode(ExprNode expr1, ExprNode expr2, Binop operator) {
        this.expr1 = expr1;
        this.expr2 = expr2;
        this.operator = operator;
        switch (operator) {
            case PLUS:
            case MINUS:
            case DIV:
            case MUL:
            case MOD:
                type = new BasicType(BasicTypeEnum.INTEGER);
                break;
            default:
                type = new BasicType(BasicTypeEnum.BOOLEAN);
        }
    }

    public ExprNode getExpr1() {
        return expr1;
    }

    public void setExpr1(ExprNode expr1) {
        this.expr1 = expr1;
    }

    public ExprNode getExpr2() {
        return expr2;
    }

    public void setExpr2(ExprNode expr2) {
        this.expr2 = expr2;
    }

    public Binop getOperator() {
        return operator;
    }

    public void setOperator(Binop operator) {
        this.operator = operator;
    }

}
