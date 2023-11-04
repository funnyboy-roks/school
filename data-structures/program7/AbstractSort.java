/*
* Author:     TJ Bowman
* Date:       7/29/2023
* Course:     CSC 220 - Data Structures
*/

public abstract class AbstractSort {
    /**
     * Returns an array of random integers between 0-99 given a size and seed
     * @param size - the desired size of the array being generated
     * @param seed - the seed used to initialize the random number generator
     * @return an array of random integers between 0-99 (without duplicates)
     */
    public abstract int[] generateRandomArray(int size, int seed);

    /**
     * Public interface to the quick sort algorithm. 
     * @param             array - the array of integers to sort
     */
    public abstract void quickSort(int[] array);

    /**
     * The shell sort algorithm.
     * @param array - the array of integers to sort
     * @param k - the spacing counter used by shell sort
     */
    public abstract void shellSort(int[] array, int k);

    /**
     * The heap sort algorithm.
     * @param array - the array of integers to sort
     */
    public abstract void heapSort(int[] array);
}
