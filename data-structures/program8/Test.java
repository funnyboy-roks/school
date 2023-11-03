public class Test {
    public static void main(String... args) {
        Dictionary map = new Dictionary();
        //map.add(c( 97), 97);
        //map.add(c(107), 107);
        //map.add(c(117), 117);
        //map.add(c(127), 127);
        //map.add(c(137), 137);
        //for (char c = 'k'; c-- > 'a'; map.add(c + "", c)); 
        //System.out.println(map);
        //System.out.println("size = " + map.getSize());
        //System.out.println(map.get("a"));

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
        
        map.hashTable[0] = new KVPair("dd", 54);
        map.hashTable[1] = new KVPair("ad", 68);
        map.hashTable[2] = map.DELETED;
        map.hashTable[3] = new KVPair("bd", 67);
        map.hashTable[4] = new KVPair("aa", 48);
        map.hashTable[5] = map.DELETED;
        map.hashTable[6] = map.DELETED;
        map.hashTable[7] = new KVPair("da", 19);
        map.hashTable[8] = new KVPair("cb", 46);
        map.hashTable[9] = new KVPair("cc", 31);
        map.numKVPairs = 10;
        System.out.println(map);
        System.out.println(map.get("bd"));
    }

    public static String c(int c) { return "" + (char) c; }
}
