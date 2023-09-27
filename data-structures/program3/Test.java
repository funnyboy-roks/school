import java.util.*;

public class Test {
    private static EasyList l;
    public static void main(String[] args) {
        //testCopyConstructor();

        testAll();

        //testSort();
    }

    public static void testSort() {
        EasyList l = new EasyList();
        //AbstractEasyList prof = new EasyListSolution();
        AbstractEasyList student = new EasyList();
        Random r = new Random();

        // Create array list of letters from A to Z
        ArrayList<Character> letters = new ArrayList<Character>();
        for (char c = 'A'; c != '['; c++) letters.add(c);
        // Fill the prof list with randomly selected letters
        for (int i = 0; i < 10; i++) student.add(letters.remove(r.nextInt(letters.size())));

        // Copy the prof list into the student list
        //student.secretCopy(prof);

        // Run the test
        System.out.println("The unsorted list: " + student);
        //prof.sort();

        //System.out.println("My sorted list: " + prof.toString());
        student.sort();

        System.out.println("Your sorted list:  " + student);

        //assertEquals(prof.toString(), student.toString());
    }

    public static void testAll() {
        testConstructor();
        System.out.println("Test empty: expect: true   found: " + l.isEmpty());
        System.out.println("Test full:  expect: false  found: " + l.isFull());
        System.out.println("contents: " + l);
        System.out.println("adding items");
        testAdd();
        System.out.println("Test empty: expect: false  found: " + l.isEmpty());
        System.out.println("Test full:  expect: false  found: " + l.isFull());
        System.out.println("contents: " + l);

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
        System.out.print("before: ");
        testToString();
        l = new EasyList(l);
        System.out.print("after: ");
        testToString();
        l.set(1, '5');
        testToString();

        for (int i = 10; --i >= 0;) l.add('.');
        System.out.println("Test full:  expect: true   found: " + l.isFull());
        System.out.println("contents: " + l);

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

    public static void testCopyConstructor() {
        EasyList student = new EasyList();
        var r = new Random();
        ArrayList<Character> letters = new ArrayList<Character>();
        for (char c = 'A'; c != '['; c++) letters.add(c);
        for (char c = 'A'; c != '['; c++) letters.add(c);
        for (char c = 'A'; c != '['; c++) letters.add(c);
        for (char c = 'A'; c != '['; c++) letters.add(c);
        //for (int i = 0; i < 10; i++) prof.add();

        for (int i = 50; --i >= 0;) student.add(letters.remove(r.nextInt(letters.size())));

        //student.secretCopy(prof);

        // Test student copy constructor
        AbstractEasyList studentCopy = new EasyList(student);
        System.out.println("The original list: " + student);
        System.out.println("Your copied list:  " + studentCopy);
        // Must contain the same elements
        //assertEquals(prof.toString(), studentCopy.toString());
        System.out.printf("%s == \n", studentCopy);
        // Must have the same end index
        //assertEquals(prof.size(), studentCopy.size());
        System.out.printf("%s == \n", studentCopy.size());
        //System.out.println();
    }

    public static void testConstructor() {
        l = new EasyList();
    }

    public static void testToString() {
        System.out.println(l);
    }

    public static void testAdd() {
        l.add('a');
        System.out.println("Add 'a' -> " + l);
        l.add('b');
        System.out.println("Add 'b' -> " + l);
        l.add('c');
        System.out.println("Add 'c' -> " + l);
        l.add('d');
        System.out.println("Add 'd' -> " + l);
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
}
