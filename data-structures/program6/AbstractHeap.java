/*
* Author:   TJ Bowman
* Date:     7/29/2023
* Course:   CSC 220 - Data Structures
*/

public abstract class AbstractHeap {
    public static final int MAX_SIZE = 10;      // The maximum number of nodes allowed in the heap
    public int size = 0;                     // The number of "nodes" in the heap
    public int[] data;                       // We represent the "nodes" and data of the heap as an array
    
    // Methods for getting the index of a node's left child, right child, or parent
    protected abstract int getLeftIndex(int index);
    protected abstract int getRightIndex(int index);
    protected abstract int getParentIndex(int index);
    
    // Methods for getting the data stored at some index in the heap
    protected abstract int getLeftData(int index);
    protected abstract int getRightData(int index);
    protected abstract int getParentData(int index);

    // Methods for checking if a node has a left child, right child, or parent
    protected abstract boolean hasLeft(int index);
    protected abstract boolean hasRight(int index);
    protected abstract boolean hasParent(int index);

    // Checks if the heap is empty/full
    public abstract boolean isEmpty();
    public abstract boolean isFull();

    /**
     * Returns the String representation of the heap
     * @return          the heap as a String
     */
    public abstract String toString();
    
    /**
     * Swap the data stored at two different indices in the heap
     * @param           index0 - the index whose data will be swapped with the data at index1
     * @param           index1 - the index whose data will be swapped with the data at index0
     */
    public abstract void swap(int index0, int index1);
    
    /**
     * Adds a new node to the heap
     * @param           element - the data to add to the heap
     */
    public abstract void add(int element);

    /**
     * Removes and returns the data stored at the root (index 0)
     * @return          the data stored at the root
     */
    public abstract int getMax();
    
    /**
     * Restores the heap property by repeatedly swapping the last leaf node up the heap until properly positioned
     */
    public abstract void maxHeapifyUp();
    
    /**
     * Restores the heap property by repeatedly swapping the root node down the heap until properly positioned
     */
    public abstract void maxHeapifyDown();
}
