/*
Name:		[Your Name Here]
Date:		[Current Date Here]
Course:		CSC 220 - Data Structures
*/
public class Test {
	public static void main(String[] args) {
        String[] exprs = {
            "10 5 +",
            "10 5 -",
            "10 5 /",
            "10 5 *",
        };

        int[] solutions = {
            15,
            5,
            2,
            50,
        };

        var solver = new InfixToPostfix();

        for (int i = exprs.length; i-- > 0; ) {
            var expr = exprs[i];
            var solu = solutions[i];
            var answ = solver.evaluatePostfix(expr.split(" "));
            System.out.printf("case %d: \"%s\" -> %s == %d\n", i, expr, answ, solu);
        }

        System.out.println();

        String[] exprs2 = {
            "1 + 2 + 3",
            "1 * 2 + 3",
            "1 + 2 * ( 3 ^ 4 - 5 ) ^ ( 6 + 7 * 8 ) - 9",
            "2 ^ 3 ^ 2",
        };

        String[] solus2 = {
            "1 2 + 3 +",
            "1 2 * 3 +",
            "1 2 3 4 ^ 5 - 6 7 8 * + ^ * + 9 -",
            "2 3 2 ^ ^",
        };

        int[] solvs2 = {
            1 + 2  + 3,
            1 * 2 + 3,
            1 + 2 * (int) Math.pow(( Math.pow(3, 4) - 5 ), ( 6 + 7 * 8 )) - 9,
            (int) Math.pow(2, Math.pow(3, 2)),
        };

        for (int i = exprs2.length; i-- > 0; ) {
            var expr = exprs2[i];
            var solu = solus2[i];
            System.out.printf("case %d: \"%s\" -> ", i, expr);
            var pf = solver.infixToPostfix(expr.split(" "));
            var answ = String.join(" ", pf);
            System.out.printf("\"%s\" == \"%s\" (%s)\n", answ, solu, answ.equals(solu));
            System.out.printf("%s == %d\n", solver.evaluatePostfix(pf), solvs2[i]);
        }

	}
}
