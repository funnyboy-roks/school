/*
Name:    Hayden Pott
Date:    29 Sept 2023
Course:  CSC 220 - Data Structures
*/

public class LinkedList<T> extends AbstractLinkedList<T> {

	/**
	 * Default Constructor - Newly constructed lists have no nodes,
	 * so head and tail point to null.
	 */
	public LinkedList() {
        this.head = this.tail = null;
	}

	/**
	 * Copy constructor - copies each element from the given linked list
	 * into the one being constructed.
	 * @param 			l - the linked list being copied from
	 */
	public LinkedList(LinkedList<T> l) {
		// TO-DO: Implement for program 04
	}

	/**
	 * Returns a String representation of the list ("NULL" if empty)
	 * @return 			String representation of the linked list
	 */
	public String toString() {
        if (this.head == null) {
            return "NULL";
        }
        StringBuilder sb = new StringBuilder();
        Node<T> next = this.head;
        do {
            sb.append(next.getData());
            sb.append(' ');
        } while((next = next.getLink()) != null);
		return sb.toString();
	}

	/**
	 * Returns the number of elements in the list (not the max capacity)
	 * @return 			number of elements in the linked list
	 */
	public int size() {
		return this.numElements;
	}

	/**
	 * Returns true if there are no elements in the list
	 * @return 			true if list is empty, false otherwise
	 */
	public boolean isEmpty() {
		return this.size() == 0;
	}

	/**
	 * Returns true if the number of elements in the list is equal to MAX_SIZE
	 * @return 			true if list is full, false otherwise
	 */
	public boolean isFull() {
		return this.size() == LinkedList.MAX_SIZE;
	}

	/**
	 * Set the current Node reference to the head node
	 */
	public void first() {
        this.current = this.head;
	}

	/**
	 * Set current to the next node in the list
	 */
	public void next() {
        this.current = this.current.getLink();
	}

	/**
	 * Return the element at the current node
	 * @return 			element stored at the current node
	 */
	public T getCurrent() {
		return this.current.getData();
	}

	/**
	 * Adds the specified element to the end of the list.
	 * Not possible for a full list.
	 * @param 			element - element to add to the linked list
	 */
	public void add(T elt) {
        Node<T> n = new Node<>();
        n.setData(elt);
        if (this.tail == null) {
            this.head = this.tail = n;
        } else {
            this.tail.setLink(this.tail = n);
        }
	}

	/**
	 * Adds the specified element to the end of the list.
	 * Not possible for a full list.
	 * @param 			element - element to add to the linked list
	 */
	public void add(int index, T elt) {
        //Node<T> n = new Node<>();
        //n.setData(elt);
        //this.tail.setLink(this.tail = n);
	}

	/**
	 * Returns the value in the node at the given index
	 * @param 			index - the position in the list to get the element from
	 * @return 			the element at index
	 */
	public T get(int index) {
        Node<T> n = this.head;
        for(int i = index; i-- > 0 && n != null; n = n.getLink());
        return n == null ? null : n.getData();
	}

	/**
	 * Returns the value in the head node
	 * @return 			the value in the head node
	 */
	public T getFirst() {
		return this.head == null ? null : this.head.getData();
	}

	/**
	 * Returns the value in the tail node
	 * @return 			the value in the tail node
	 */
	public T getLast() {
		return this.tail == null ? null : this.tail.getData();
	}

	/**
	 * Removes the element at the specified index.
	 * Not possible for an empty list
	 * @param			index - the position in the list of the element to be removed
	 */
	public void remove(int index) {
        Node<T> n = this.head;
        for(int i = index; i-- > 0 && n != null; n = n.getLink());
	}

	/**
	 * Replaces the element at the specified index with the given element
	 * @param			index - the position in the list of the element to replace
	 * @param			element - the element to replace the current element at index
	 */
	public void set(int index, T element) {
		// TO-DO: Complete for Program 04
	}

	/**
	 * Returns the index of the first occurrence of the specified element.
	 * Returns -1 if the list does not contain the element.
	 * @param			element - the element whose index is being searched for
	 * @return 			the index of element, or -1 if it doesn't exist
	 */
	public int indexOf(T element) {
        Node<T> next = this.head;
        int i = 0;
        do {
            if (java.util.Objects.equals(next.getData(), element)) {
                return i;
            }
            ++i;
        } while ((next = next.getLink()) != null);
        return -1;
    }
}
