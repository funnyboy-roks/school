/*
Name:   Hayden Pott
Date:   27 Oct 2023
Course: CSC 220 - Data Structures
*/

public class Sort extends AbstractSort {

    public static void main(String... args) {
        Sort s = new Sort();
        int[] arr = s.generateRandomArray(10, 1);
        s.shellSort(arr, 3);
        System.out.println(java.util.Arrays.toString(arr));
    }

    /**
     * Returns an array of random integers between 0-99 given a size and seed
     * @param             size - the desired size of the array being generated
     * @param             seed - the seed used to initialize the random number generator
     * @return             an array of random integers between 0-99 (without duplicates)
     */
    public int[] generateRandomArray(int size, int seed) {
        java.util.Random rng = new java.util.Random();
        rng.setSeed(seed);
        int[] arr = new int[size];
        for (int i = arr.length; i-- > 0;) {
            arr[i] = rng.nextInt(100);
        }
        return arr;
    }

    /**
     * Public interface to the quick sort algorithm. 
     * @param array - the array of integers to sort
     */
    public void quickSort(int[] array) {
        
    }

    /**
     * Recursive quickSort algorithm.  This version always chooses the first element as the pivot,
     * but this is not the only or best method for choosing a pivot!
     * Uses the private quickSort method to do the sorting.
     * @param array - the array of integers to sort
     * @param first - the index of the first element in the current subarray being sorted
     * @param last - the index of the last element in the current subarray being sorted
     */
    private void quickSort(int[] array, int first, int last) {
        
    }

    /**
     * The shell sort algorithm.
     * @param array - the array of integers to sort
     * @param k - the spacing counter used by shell sort
     */
    public void shellSort(int[] array, int k) {
        while (k-- > 1)
            for (int tmp, j, i = k; i < array.length; array[j] = tmp)
                for (tmp = array[j = i++]; j >= k && array[j - k] > tmp; array[j] = array[j -= k]);
    }

    /**
     * The heap sort algorithm.
     * @param array - the array of integers to sort
     */
    public void heapSort(int[] array) {
        Heap h = new Heap();
        for (int i = array.length; i-- > 0; h.add(array[i]));
        // We don't have access to the heap's array, so we'll just copy the elts over
        for (int i = array.length; i-- > 0; array[i] = h.getMax());
    }
}
