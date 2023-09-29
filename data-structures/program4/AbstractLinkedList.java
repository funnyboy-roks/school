/*
* Author:	TJ Bowman
* Date:		7/29/2023
* Course: 	CSC 220 - Data Structures
*/

public abstract class AbstractLinkedList<Type> {
	public static final int MAX_SIZE = 10;
	protected Node<Type> head;
	protected Node<Type> current;
	protected Node<Type> tail;
	protected int numElements;

	/**
	 * Returns a String representation of the list ("NULL" if empty)
	 * @return 			String representation of the linked list
	 */
	public abstract String toString();

	/**
	 * Returns the number of elements in the list (not the max capacity)
	 * @return 			number of elements in the linked list
	 */
	public abstract int size();

	/**
	 * Returns true if there are no elements in the list
	 * @return 			true if list is empty, false otherwise
	 */
	public abstract boolean isEmpty();

	/**
	 * Returns true if the number of elements in the list is equal to MAX_SIZE
	 * @return 			true if list is full, false otherwise
	 */
	public abstract boolean isFull();

	/**
	 * Set the current Node reference to the head node
	 */
	public abstract void first();

	/**
	 * Set current to the next node in the list
	 */
	public abstract void next();

	/**
	 * Return the element at the current node
	 * @return 			element stored at the current node
	 */
	public abstract Type getCurrent();

	/**
	 * Adds the specified element to the end of the list.
	 * Not possible for a full list.
	 * @param 			element - element to add to the linked list
	 */
	public abstract void add(Type element);

	/**
	 * Adds the specified element to the list at the given index
	 * Not possible for a full list
	 * @param			index - the position in the list to add the element
	 * @param			element - the element to be added to the list
	 */
	public abstract void add(int index, Type element);

	/**
	 * Returns the value in the node at the given index
	 * @param 			index - the position in the list to get the element from
	 * @return 			the element at index
	 */
	public abstract Type get(int index);

	/**
	 * Returns the value in the head node
	 * @return 			the value in the head node
	 */
	public abstract Type getFirst();

	/**
	 * Returns the value in the tail node
	 * @return 			the value in the tail node
	 */
	public abstract Type getLast();

	/**
	 * Removes the element at the specified index.
	 * Not possible for an empty list
	 * @param			index - the position in the list of the element to be removed
	 */
	public abstract void remove(int index);

	/**
	 * Replaces the element at the specified index with the given element
	 * @param			index - the position in the list of the element to replace
	 * @param			element - the element to replace the current element at index
	 */
	public abstract void set(int index, Type element);

	/**
	 * Returns the index of the first occurrence of the specified element.
	 * Returns -1 if the list does not contain the element.
	 * @param			element - the element whose index is being searched for
	 * @return 			the index of element, or -1 if it doesn't exist
	 */
	public abstract int indexOf(Type element);
}
