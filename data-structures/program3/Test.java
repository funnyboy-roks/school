public class Test {
    private static EasyList l;
	public static void main(String[] args) {
        testConstructor();
        testToString();
        testAdd();
        testToString();
        System.out.printf("Size = %d\n", l.size());
        l.add(0, '0');
        testToString();
        System.out.printf("Size = %d\n", l.size());
        l.add(6, '6');
        testToString();
        System.out.printf("Size = %d\n", l.size());
        testGet();
        testRemove();
        System.out.println("Test copy constructor");
        l = new EasyList(l);
        testToString();
        l.set(1, '5');
        testToString();

        System.out.println("New list");
        l = new EasyList();
        l.add('e');
        l.add('d');
        l.add('a');
        l.add('b');
        l.add('c');
        testToString();
        l.sort();
        System.out.print("Sorted: ");
        testToString();

        System.out.printf("indexOf('a') = %s\n", l.indexOf('a'));
        System.out.printf("indexOf('e') = %s\n", l.indexOf('e'));
        System.out.printf("indexOf('g') = %s\n", l.indexOf('g'));
	}

	public static void testConstructor() {
        l = new EasyList();
	}

	public static void testToString() {
        System.out.println(l);
	}

	public static void testAdd() {
        l.add('a');
        l.add('b');
        l.add('c');
        l.add('d');
	}

	public static void testGet() {
        System.out.printf("l[0] = %s\n", l.get(0));
        System.out.printf("l[1] = %s\n", l.get(1));
        System.out.printf("l[2] = %s\n", l.get(2));
        System.out.printf("l[3] = %s\n", l.get(3));
        System.out.printf("l[4] = %s\n", l.get(4));
        System.out.printf("l[5] = %s\n", l.get(5));
        System.out.printf("l[6] = %s\n", l.get(6));
        System.out.printf("l[7] = %s\n", l.get(7));
        System.out.printf("l[8] = %s\n", l.get(8));
        System.out.printf("l[9] = %s\n", l.get(9));
	}

	public static void testRemove() {
        l.remove(3);
        System.out.printf("Removed 3: %s\n", l);
	}

	public static void testSet() {
		
	}

	public static void testIndexOf() {
		
	}

	public static void testSort() {
		
	}
}
