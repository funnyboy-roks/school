/*
Name:   Hayden Pott
Date:   18 Oct 2023
Course: CSC 220 - Data Structures
*/

public class Heap extends AbstractHeap {
    /**
     * Default constructor - initializes data to have a size equal to MAX_SIZE
     */
    public Heap() {
        this.data = new int[MAX_SIZE];
    }
    
    // Methods for getting the index of a node's left child, right child, or parent
    protected int getLeftIndex(int index) {
        return 2 * index + 1;
    }
    protected int getRightIndex(int index) {
        return 2 * index + 2;
    }
    protected int getParentIndex(int index) {
        return (index - 1) / 2;
    }
    
    // Methods for getting the data stored at some index in the heap
    protected int getLeftData(int index) {
        return this.data[this.getLeftIndex(index)];
    }
    protected int getRightData(int index) {
        return this.data[this.getRightIndex(index)];
    }
    protected int getParentData(int index) {
        return this.data[this.getParentIndex(index)];
    }

    // Methods for checking if a node has a left child, right child, or parent
    protected boolean hasLeft(int index) {
        return this.size > this.getLeftIndex(index);
    }
    protected boolean hasRight(int index) {
        return this.size > this.getRightIndex(index);
    }
    protected boolean hasParent(int index) {
        return this.size > this.getParentIndex(index);
    }

    // Checks if the heap is empty/full
    public boolean isEmpty() {
        return this.size == 0;
    }

    public boolean isFull() {
        return this.size == Heap.MAX_SIZE;
    }


    /**
     * Returns the String representation of the heap
     * @return          the heap as a String
     */
    public String toString() {
        StringBuilder sb = new StringBuilder();
        // append each elt to the string + ' '
        for (int i = 0; i < this.size; sb.append(this.data[i++]).append(' '));
        return sb.toString().trim();
    }

    /**
     * @return The index of the max child
     */
    private int getMaxChild(int index) {
        int left = this.getLeftIndex(index);
        int right = this.getRightIndex(index);

        if (right < this.size) {
            return this.data[right] < this.data[left] ? left : right;
        }

        return left;
    }
    
    /**
     * Swap the data stored at two different indices in the heap
     * @param           index0 - the index whose data will be swapped with the data at index1
     * @param           index1 - the index whose data will be swapped with the data at index0
     */
    public void swap(int index0, int index1) {
        // swap two elts using magic
        this.data[index0] = this.data[index0] ^ this.data[index1];
        this.data[index1] = this.data[index0] ^ this.data[index1];
        this.data[index0] = this.data[index0] ^ this.data[index1];
    }
    
    /**
     * Adds a new node to the heap
     * @param           element - the data to add to the heap
     */
    public void add(int element) {
        // if the heap is full, ignore add
        if (this.size == Heap.MAX_SIZE) return;
        // add element
        this.data[this.size++] = element;
        // do magic
        this.maxHeapifyUp();
    }

    /**
     * Removes and returns the data stored at the root (index 0)
     * @return          the data stored at the root
     */
    public int getMax() {
        // if it's empty, return -1
        if (this.isEmpty()) return -1;
        // swap the last elt
        this.swap(0, --this.size);
        // do magic
        this.maxHeapifyDown();
        // return the removed elt
        return this.data[this.size];
    }
    
    /**
     * Restores the heap property by repeatedly swapping the last leaf node up the heap until properly positioned
     */
    public void maxHeapifyUp() {
        for (int i = this.size - 1; this.data[i] > this.getParentData(i); this.swap(i, i = this.getParentIndex(i)));
    }
    
    /**
     * Restores the heap property by repeatedly swapping the root node down the heap until properly positioned
     */
    public void maxHeapifyDown() {
        for (int i = 0; this.hasLeft(i) && this.data[this.getMaxChild(i)] > this.data[i]; this.swap(i, i = this.getMaxChild(i)));
    }
}
