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
        this();
        // read all values from `l` and add them to this
        for (int i = 0, c = l.size(); i < c; ++i) {
            this.add(l.get(i));
        }
	}

	/**
	 * Returns a String representation of the list ("NULL" if empty)
	 * @return 			String representation of the linked list
	 */
	public String toString() {
        // early return if there is no value
        if (this.head == null) {
            return "NULL";
        }

        StringBuilder sb = new StringBuilder();
        Node<T> next = this.head;
        // loop over each node, adding it to the string
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
        // Ignore if the list is full
        if (this.size() >= LinkedList.MAX_SIZE) {
            return;
        }

        Node<T> n = new Node<>();
        n.setData(elt);
        if (this.tail == null) { // if the list is empty, set the head/tail to the new node
            this.head = this.tail = n;
        } else {
            // Otherwise, link from the old tail and update the tail
            this.tail.setLink(this.tail = n);
        }
        ++this.numElements;
	}

	/**
	 * Adds the specified element to the end of the list.
	 * Not possible for a full list.
	 * @param 			element - element to add to the linked list
	 */
	public void add(int index, T elt) {
        // Check bounds
        if (index < 0 || index > this.size() || this.size() >= LinkedList.MAX_SIZE) {
            return;
        }

        // If adding to the head, update the head
        if (index == 0) {
            Node<T> newN = new Node<>();
            newN.setData(elt);
            newN.setLink(this.head);
            this.head = newN;
            ++this.numElements;
            return;
        }

        // If we're adding to the end, use the standard add method
        if (index == this.size()) {
            this.add(elt);
            return;
        }

        // Jump to the node before the one to be added
        Node<T> n = this.head;
        for(int i = index - 1; i-- > 0 && n != null; n = n.getLink());

        if (n == null) {
            return;
        }

        // Do the magic to point the node to the new one and the new one to the next one
        Node<T> newN = new Node<>();
        newN.setData(elt);
        newN.setLink(n.getLink());
        n.setLink(newN);

        ++this.numElements;
	}

	/**
	 * Returns the value in the node at the given index
	 * @param 			index - the position in the list to get the element from
	 * @return 			the element at index
	 */
	public T get(int index) {
        // Jump to the node that has been requested
        Node<T> n = this.head;
        for(int i = index; i-- > 0 && n != null; n = n.getLink());

        return n == null ? null : n.getData();
	}

	/**
	 * Returns the value in the head node
	 * @return 			the value in the head node
	 */
	public T getFirst() {
        // Get the data of the head, if it is set
		return this.head == null ? null : this.head.getData();
	}

	/**
	 * Returns the value in the tail node
	 * @return 			the value in the tail node
	 */
	public T getLast() {
        // Get the data of the tail, if it is set
		return this.tail == null ? null : this.tail.getData();
	}

	/**
	 * Removes the element at the specified index.
	 * Not possible for an empty list
	 * @param			index - the position in the list of the element to be removed
	 */
	public void remove(int index) {
        // Check bounds
        if (index < 0 || index >= this.size()) {
            return;
        }

        // If it's the head, point this.head at the new head
        if (index == 0) {
            if ((this.head = this.head.getLink()) == null) {
                // if the last element was removed, fix the tail
                this.tail = null;
            }
            --this.numElements;
            return;
        }

        // Jump to the node before the one being removed
        Node<T> n = this.head;
        for(int i = index - 1; i-- > 0 && n != null; n = n.getLink());

        if (n == null) {
            return;
        }

        // Update the reference
        n.setLink(n.getLink().getLink());
        --this.numElements;
	}

	/**
	 * Replaces the element at the specified index with the given element
	 * @param			index - the position in the list of the element to replace
	 * @param			element - the element to replace the current element at index
	 */
	public void set(int index, T element) {
        // Check bounds
        if (index < 0 || index >= this.size() || this.size() >= LinkedList.MAX_SIZE) {
            return;
        }

        // Jump to the node that is being set
        Node<T> n = this.head;
        for(int i = index; i-- > 0 && n != null; n = n.getLink());

        // Set the data
        n.setData(element);
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
        // loop over nodes until we hit the one that we're looking for
        do {
            if (java.util.Objects.equals(next.getData(), element)) {
                return i;
            }
            ++i;
        } while ((next = next.getLink()) != null);
        return -1;
    }
}
