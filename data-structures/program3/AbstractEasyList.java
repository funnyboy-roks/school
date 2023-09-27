/*
* Author:	TJ Bowman
* Date:		7/29/2023
* Course: 	CSC 220 - Data Structures
*/

public abstract class AbstractEasyList {
	protected static final int MAX_SIZE = 10;	// the maximum number of elements the list can hold
	protected int end;							// the index of the last valid item in the list
	protected char[] list;						// the list

	/**
	 * Returns the number of elements in the list (not the max capacity)
	 * @return 		number of elements in list
	 */
	public abstract int size();

	/**
	 * Returns a String representation of the list ("NULL" if empty)
	 * @return 		String representation of list
	 */
	public abstract String toString();

	/**
	 * Adds the specified element to the end of the list.
	 * Not possible for a full list.
	 * @param 		element - the element to be added to the list
	 */
	public abstract void add(char element);

	/**
	 * Adds the specified element at the specified position in the list.
	 * Elements are shifted to the right to make room.
	 * Not possible for a full list.
	 * @param 		index - the position in the list where the element will be added
	 * @param 		element - the element to be added to the list
	 */
	public abstract void add(int index, char element);

	/**
	 * Returns the element at the specified index
	 * @param 		index - the position in the list of the element we are getting
	 * @return 		the element at index
	 */
	public abstract char get(int index);

	/**
	 * Removes the element at the specified index.
	 * Elements are shifted to the left to fill in the space.
	 * Not possible for an empty list.
	 * @param 		index - the position in the list of the element we are removing
	 */
	public abstract void remove(int index);

	/**
	 * Replaces the element at the specified index with the element.
	 * Not possible for an empty list.
	 * @param 		index - the position in the list of the element we are replacing
	 * @param 		element - the element replacing the existing element at index
	 */
	public abstract void set(int index, char element);

	/**
	 * Returns the index of the first occurrence of the specified element.
	 * Returns -1 if the list does not contain the element.
	 * @param 		element - the element being searched for
	 * @return 		the index of element, or -1 if it doesn't exist
	 */
	public abstract int indexOf(char element);

	/**
	 * Sorts the list in ascending order using insertion sort.
	 */
	public abstract void sort();

	/**
	 * Returns true if there are no elements in the list
	 * @return 		true if list is empty, false otherwise
	 */
	public abstract boolean isEmpty();

	/**
	 * Returns true if the number of elements in the list is equal to MAX_SIZE
	 * @return 		true if list is full, false otherwise
	 */
	public abstract boolean isFull();
}
