/*
Name:		[Your Name Here]
Date:		[Current Date Here]
Course:		CSC 220 - Data Structures
*/
import java.util.LinkedList;
public class Queue<T> {

    private final LinkedList<T> inner = new LinkedList<>();

	/**
	 * Adds an element to the back of the queue (the end of the linked list)
	 * @param 		element - the element to be enqueued
	 */
	public void enqueue(T element) {
        inner.add(element);
	}

	/**
	 * Removes and returns the element at the front of the queue (the beginning of the linked list)
	 * @return 		the element at the front of the queue
	 */
	public T dequeue() {
		return inner.remove(0);
	}

	/**
	 * Returns the element at the front of the queue WITHOUT removing it
	 * @return 		the element on top of the stack
	 */
	public T peek() {
		return inner.get(0);
	}

    public boolean isEmpty() {
        return inner.isEmpty();
    }

    @Override
    public String toString() {
        return inner.toString();
    }

    public int size() {
        return inner.size();
    }
}
