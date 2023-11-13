import java.util.Map;
import java.util.Objects;

public class Test {

    public static void assert_eq(Object left, Object right, String... text) {
        if (!Objects.equals(left, right)) {
            throw new RuntimeException("left != right: %s\nleft  = %s\nright = %s".formatted(String.join(" ", text), left, right));
        }
    }

    public static void assert_(boolean b, String... text) {
        if (!b) {
            throw new RuntimeException("assertion failed: %s".formatted(String.join(" ", text)));
        }
    }

    public static <K, V> void assert_map_eq(Map<K, V> left, Map<K, V> right) {
        left.forEach((k, v) -> assert_eq(v, right.get(k)));
    }

    public static void main(String... args) {
        Map<String, Integer> map = new HashMap<>();
        Map<String, Integer> map2 = new java.util.HashMap<>();
        for (char c = 'z' + 1; c-- > 'a'; map.put(c + "", (int) c)) map2.put(c + "", (int) c);
        System.out.println("map  = " + map);
        System.out.println("map2 = " + map2);
        assert_eq(map.size(), map2.size());
        assert_eq(map.get("a"), map2.get("a"), "get a");
        assert_eq(map.get("not here"), map2.get("not here"), "null check");
        assert_map_eq(map, map2);

        //System.out.println("\nremove a");
        //map.remove("a");
        //System.out.println(map);
        //System.out.println("size = " + map.getSize());

        //System.out.println("\nremove 123");
        //map.remove("123");
        //System.out.println(map);
        //System.out.println("size = " + map.getSize());

        //System.out.println("\nadd k");
        //map.add("k", 107);
        //System.out.println(map);
        //System.out.println("size = " + map.getSize());
        
        //map.add("bb", 39.0);
        //System.out.println(map);
    }
}
