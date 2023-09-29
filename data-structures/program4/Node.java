/*
Name:    Hayden Pott
Date:    29 Sept 2023
Course:  CSC 220 - Data Structures
*/

public class Node<T> {

    private Node<T> next;
    private T data;

	/**
	 * Default constructor - Newly constructed nodes have no data or link
	 */
	public Node() {
        this.next = null;
	}
 
	/**
	 * Accessor for the node's data
	 * @return 			data
	 */
	public T getData() {
        return this.data;
	}

	/**
	 * Mutator for the node's data
	 * @param 			data - data to store in the node
	 */
	public void setData(T data) {
        this.data = data;
	}

	/**
	 * Accessor for the node's link
	 * @return 			link
	 */
	public Node<T> getLink() {
		return this.next;
	}

	/**
	 * Mutator for the node's link
	 * @param 			link - node to link to
	 */
	public void setLink(Node<T> next) {
        this.next = next;
	}
}
