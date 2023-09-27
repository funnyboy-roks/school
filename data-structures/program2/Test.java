public class Test {
    public static void main(String[] args) {
        var a = new ComplexityAnalyzer();

        System.out.println("exp " + a.analyzeComplexity(5, 32));
        System.out.println("cub " + a.analyzeComplexity(2, 8));
    }
}
