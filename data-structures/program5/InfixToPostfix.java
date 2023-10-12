/*
Name:   Hayden Pott
Date:   11 Oct 2023
Course: CSC 220 - Data Structures
*/
public class InfixToPostfix extends AbstractInfixToPostfix {
    /**
     * Evaluate the result of two String operands (a & b) and a String operator and return the result as a String
     * @param 			a - the first operand
     * @param 			b - the second operand
     * @param 			operator - the operator
     * @return 			The result of "a operator b"
     */
    public String evaluate(String a, String b, String operator) {
    	return null;
    }

    /**
     * Returns true if the given token is an operand
     * @param 			token - the token to test
     * @return 			true if token is an integer, false otherwise
     */
    public boolean isOperand(String tok) {
        return false;
    }

    /**
     * Returns the infix ranking of the given operator, or 0 by default
     * @param 			operator - the operator to analyze
     * @return 			the infix rank of operator
     */
    public int infixOpRank(String operator) {
        if (operator == null) return 0;
        switch (operator) {
            case "(": return 4;
            case "^": return 3;
            case "*": return 2;
            case "/": return 2;
            case "+": return 1;
            case "-": return 1;
            default: return 0;
        }
    }

    /**
     * Returns the operator stack ranking of the given operator, or 0 by default
     * @param			operator - the operator to analyze
     * @return 			the operator stack rank of operator
     */
    public int opStackRank(String operator) {
        if (operator == null) return 0;
        switch (operator) {
            case "^": return 2;
            case "*": return 2;
            case "/": return 2;
            case "+": return 1;
            case "-": return 1;
            default: return 0;
        }
    }

    /**
     * Separates a space separated mathematical expression in String representation
     * and returns an array of Strings containing the individual elements
     * @param 			expressionString - the expression in String format to separate
     * @return 			An array of the operands and operators in expressionString
     */
    public String[] parseExpression(String expressionString) {
    	return null;
    }

    /**
     * Returns the string representation of an expression
     * @param			expression - an array of operands and operators forming a mathematical expression
     * @return 			expression as a single, space separated String
     */
    public String expressionToString(String[] expression) {
    	return null;
    }

    /**
     * Evaluate a postfix expression
     * Integers only, so the division operation is integer division (no remainder from division)
     * @param 			postfixExpression - the postfix expression to evaluate
     * @return 			The result from evaluating postfixExpression
     */
    public String evaluatePostfix(String[] expr) {
        Stack<String> s = new Stack<>();
        for (String tok : expr) {
            if (opStackRank(tok) == 0) {
                s.push(tok);
            } else {
                int arg2 = Integer.parseInt(s.pop());
                int arg1 = Integer.parseInt(s.pop());
                int res;
                switch (tok) {
                    case "+":
                        res = arg1 + arg2;
                        break;
                    case "-":
                        res = arg1 - arg2;
                        break;
                    case "/":
                        res = arg1 / arg2;
                        break;
                    case "*":
                        res = arg1 * arg2;
                        break;
                    case "^":
                        res = (int) Math.pow(arg1, arg2);
                        break;
                    default: throw new RuntimeException("Unreachable");
                }
                s.push(res + "");
            }
        }
    	return s.pop();
    }

    /**
     * Convert an infix expression to a postfix expression
     * @param 			infixExpression - the infix expression to convert to postfix
     * @return 			The postfix expression representation of infixExpression
     */
    public String[] infixToPostfix(String[] exprs) {
        Queue<String> in = new Queue<>();
        for (String expr : exprs) in.enqueue(expr);
        Queue<String> pf = new Queue<>();
        Stack<String> ops = new Stack<>();

        String tok;
        do {
            switch (tok = in.dequeue()) {
                case ")":
                    for (String op = ops.pop(); !op.equals("("); op = ops.pop()) pf.enqueue(op);
                    break;
                case "^":
                case "*":
                case "/":
                case "+":
                case "-":
                case "(":
                    for (String op = ops.peek(); opStackRank(op) >= infixOpRank(tok); op = ops.peek()) pf.enqueue(ops.pop());
                    ops.push(tok);
                    break;
                default:
                    pf.enqueue(tok);
                    break;
            }
        } while (!in.isEmpty());

        for (;!ops.isEmpty(); pf.enqueue(ops.pop()));

        String[] out = new String[pf.size()];
        for (int i = 0; i < out.length; out[i++] = pf.dequeue());
        
        return out;
    }
}
