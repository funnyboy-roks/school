/*
Name:		[Your Name Here]
Date:		[Current Date Here]
Course:		CSC 220 - Data Structures
*/
public class Stack<T> {
    private final java.util.Stack<T> inner = new java.util.Stack<>();

	/**
	 * adds an element on top of the stack (at the beginning of the linked list)
	 * @param 		element - the element to be pushed
	 */
	public void push(T element) {
        inner.push(element);
	}

	/**
	 * returns the element on top of the stack and removes it
	 * @return 		the element on top of the stack
	 */
	public T pop() {
        return inner.pop();
	}

	/**
	 * returns the element on top of the stack WITHOUT removing it
	 * @return 		the element on top of the stack
	 */
	public T peek() {
        return inner.isEmpty() ? null : inner.peek();
	}

    public boolean isEmpty() {
        return inner.isEmpty();
    }

    @Override
    public String toString() {
        return inner.toString();
    }
}
