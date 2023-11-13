import java.util.Map;
import java.util.Objects;

public class Test {

    /**
     * Assert that two objects are equal using {@link Objects#equals}
     */
    public static void assert_eq(Object left, Object right, String... text) {
        if (!Objects.equals(left, right)) {
            throw new RuntimeException("left != right: %s\nleft  = %s\nright = %s".formatted(String.join(" ", text), left, right));
        }
        if (text.length > 0) {
            System.out.printf("Passed Test: %s\n", String.join(" ", text));
        }
    }

    /**
     * Assert that a boolean value is true
     */
    public static void assert_(boolean b, String... text) {
        if (!b) {
            throw new RuntimeException("assertion failed: %s".formatted(String.join(" ", text)));
        }
        if (text.length > 0) {
            System.out.printf("Passed Test: %s\n", String.join(" ", text));
        }
    }

    /**
     * Assert that two maps contain identical values (via {@link #assert_eq})
     */
    public static <K, V> void assert_map_eq(Map<K, V> left, Map<K, V> right, String... text) {
        assert_eq(left.size(), right.size(), "left map and right map have different sizes");
        left.forEach((k, v) -> assert_eq(v, right.get(k)));
        if (text.length > 0) {
            System.out.printf("Passed Test: %s\n", String.join(" ", text));
        }
    }

    public static void main(String... args) {
        Map<String, Integer> map = new HashMap<>();
        Map<String, Integer> std = new java.util.HashMap<>();

        // add characters 'a'..='z' with values 0..=25
        for (char c = 'z' + 1; c-- > 'a'; map.put(c + "", c - 'a')) std.put(c + "", c - 'a');

        System.out.println("The maps (note: the order is almost guaranteed to be different between my impl and the std lib):");
        System.out.println("map = " + map);
        System.out.println("std = " + std);

        assert_eq(map.size(), std.size(), "check map size");
        assert_map_eq(map, std, "Compare to std map");
        assert_eq(map.get("a"), std.get("a"), "get \"a\"");
        assert_eq(map.get("not here"), std.get("not here"), "null check");
        assert_eq(map.remove("c"), std.remove("c"), "remove \"c\"");
        assert_eq(map.remove("g"), std.remove("g"), "remove \"g\"");
        assert_map_eq(map, std, "Compare to std map");
        assert_eq(map.get("g"), std.get("g"), "get \"g\"");
        assert_eq(map.remove("k"), std.remove("k"), "remove \"k\"");
        assert_eq(map.remove("q"), std.remove("q"), "remove \"q\"");
        assert_eq(map.size(), std.size(), "check map size");
        assert_eq(map.get("a"), std.get("a"), "get \"a\"");
        assert_map_eq(map, std, "Compare to std map");
    }
}
