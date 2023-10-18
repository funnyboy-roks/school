public class Test {
    public static void main(String... args) {
        Heap heap = new Heap();

        heap.add(10);
        heap.add(31);
        heap.add( 2);
        heap.add( 3);
        heap.add(18);
        heap.add(56);
        heap.add( 0);

        //heap.data = new int[]{ 4, 8, 6, 7, 1, 5, 0, 3, 0, 0 };
        //heap.size = 8;

        System.out.println(heap);
        Heap heap2 = new Heap();
        while (!heap.isEmpty()) {
          int n = heap.getMax();
          //heap2.add(n);
          System.out.println(n);
        }
        //heap.maxHeapifyDown();
        //System.out.println("expected = 8 7 6 4 1 5 0 3");
        //System.out.println("got      = " + heap);
        System.out.println(heap2);
    }
}
