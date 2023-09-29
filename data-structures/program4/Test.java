public class Test {
    public static void main(String... args) {
        LinkedList<String> l = new LinkedList<>();
        l.add("a");
        l.add("b");
        l.add("c");
        System.out.println(l);
        System.out.println("indexOf(\"a\") = " + l.indexOf("a"));
        System.out.println("indexOf(\"b\") = " + l.indexOf("b"));
        System.out.println("indexOf(\"c\") = " + l.indexOf("c"));

        for (int i = 0; i < 3; ++i) {
            System.out.printf("get(%d) = \"%s\"\n", i, l.get(i));
        }
    }
}
