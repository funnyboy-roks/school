import java.util.*;

public class Test {
    private static final Random RNG = new Random();
    public static void main(String... args) {
        LinkedList<String> l = new LinkedList<>();

        Set<String> addedAlready = new HashSet<>();
        System.out.printf("Fill list");
        int expectedSize = 0;
        for(int i = 6; --i >= 0;) {
            String s = rand();
            if (addedAlready.contains(s)) {
                ++i;
                continue;
            }
            l.add(s);
            addedAlready.add(s);
            if (++expectedSize > LinkedList.MAX_SIZE) {
                expectedSize = LinkedList.MAX_SIZE;
            }
        }
        System.out.printf(" -> %s\n", l);

        for(int i = 6; --i >= 0;) {
            int n = RNG.nextInt(l.size() - 1);
            String s = rand();
            if (addedAlready.contains(s)) {
                ++i;
                continue;
            }
            System.out.printf("add(%d, \"%s\")", n, s);
            l.add(n, s);
            System.out.printf(" -> %s\n", l);
            if (++expectedSize > LinkedList.MAX_SIZE) {
                expectedSize = LinkedList.MAX_SIZE;
            }
        }

        System.out.printf("size() = %d", l.size());
        if (l.size() != expectedSize) {
            System.out.printf("  (Expected %d)\n", expectedSize);
        } else {
            System.out.println("  ✔");
        }

        for (int i = 0; i < l.size(); ++i) {
            int n = RNG.nextInt(l.size() - 1);
            String s = l.get(n);
            int no = l.indexOf(s);
            System.out.printf("indexOf(\"%s\") = %d", s, no);
            if (n != no) {
                System.out.printf("  (Expected %d)\n", n);
            } else {
                System.out.println("  ✔");
            }
        }

        for (int i = 0; i < l.size(); ++i) {
            System.out.printf("get(%d) = \"%s\"\n", i, l.get(i));
        }

        for (int i = 3; --i >= 0;) {
            int n = RNG.nextInt(l.size() - 1);
            System.out.printf("remove(%d)", n);
            l.remove(n);
            System.out.printf(" -> %s\n", l);
            --expectedSize;
        }

        System.out.printf("size() = %d", l.size());
        if (l.size() != expectedSize) {
            System.out.printf("  (Expected %d)\n", expectedSize);
        } else {
            System.out.println("  ✔");
        }

        for (int i = 3; --i >= 0;) {
            int n = RNG.nextInt(l.size() - 1);
            String s = rand();
            System.out.printf("set(%d, \"%s\")", n, s);
            l.set(n, s);
            System.out.printf(" -> %s\n", l);
        }

        System.out.printf("size() = %d", l.size());
        if (l.size() != expectedSize) {
            System.out.printf("  (Expected %d)\n", expectedSize);
        } else {
            System.out.println("  ✔");
        }
    }

    public static String rand() {
        char n = (char) (RNG.nextInt('z' - 'a') + 'a');
        return n + "";
    }
}
