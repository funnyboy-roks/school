/*
* Author:	TJ Bowman
* Date:		7/29/2023
* Course:	CSC 220 - Data Structures
*/

public abstract class AbstractInfixToPostfix {
	/**
	 * Evaluate the result of two String operands (a & b) and a String operator and return the result as a String
	 * @param 			a - the first operand
	 * @param 			b - the second operand
	 * @param 			operator - the operator
	 * @return 			The result of "a operator b"
	 */
	public abstract String evaluate(String a, String b, String operator);

	/**
	 * Returns true if the given token is an integer
	 * @param 			token - the token to test
	 * @return 			true if token is an integer, false otherwise
	 */
	public abstract boolean isOperand(String token);

	/**
	 * Returns the infix ranking of the given operator, or 0 by default
	 * @param 			operator - the operator to analyze
	 * @return 			the infix rank of operator
	 */
	public abstract int infixOpRank(String operator);

	/**
	 * Returns the operator stack ranking of the given operator, or 0 by default
	 * @param			operator - the operator to analyze
	 * @return 			the operator stack rank of operator
	 */
	public abstract int opStackRank(String operator);

	/**
	 * Separates a space separated mathematical expression in String representation
	 * and returns an array of Strings containing the individual elements
	 * @param 			expressionString - the expression in String format to separate
	 * @return 			An array of the operands and operators in expressionString
	 */
	public abstract String[] parseExpression(String expressionString);

	/**
	 * Returns the string representation of an expression
	 * @param			expression - an array of operands and operators forming a mathematical expression
	 * @return 			expression as a single, space separated String
	 */
	public abstract String expressionToString(String[] expression);

	/**
	 * Evaluate a postfix expression
	 * Integers only, so the division operation is integer division (no remainder from division)
	 * @param 			postfixExpression - the postfix expression to evaluate
	 * @return 			The result from evaluating postfixExpression
	 */
	public abstract String evaluatePostfix(String[] postfixExpression);

	/**
	 * Convert an infix expression to a postfix expression
	 * @param 			infixExpression - the infix expression to convert to postfix
	 * @return 			The postfix expression representation of infixExpression
	 */
	public abstract String[] infixToPostfix(String[] infixExpression);
}