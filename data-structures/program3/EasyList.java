/**
 * Name:   Hayden Pott
 * Date:   25 Sept 2023
 * Course: CSC 220 - Data Structures
 */

public class EasyList extends AbstractEasyList {

	/**
	 * Default constructor - constructs an empty list of initial capacity MAX_SIZE.
	 * end is set to -1 to indicate the list is empty.
	 */
	public EasyList() {
        this.list = new char[EasyList.MAX_SIZE];
        this.end = -1;
	}

	/**
	 * Copy constructor - constructs an EasyList whose elements are copied from
	 * the given EasyList
	 * @param		other EasyList to copy from
	 */
	public EasyList(EasyList other) {
        this.end = other.end;
        this.list = new char[EasyList.MAX_SIZE];
        System.arraycopy(other.list, 0, this.list, 0, this.end + 1);
	}

	/**
	 * Returns the number of elements in the list (not the max capacity)
	 * @return 		number of elements in list
	 */
	public int size() {
		return this.end + 1;
	}

	/**
	 * Returns a String representation of the list ("NULL" if empty)
	 * @return 		String representation of list
	 */
    @Override
	public String toString() {
        if (this.end == -1) {
            return "NULL";
        }

        String out = "";
        for(int i = 0; i <= this.end; ++i) {
            out += this.list[i] + " ";
        }
        return out;
	}

	/**
	 * Adds the specified element to the end of the list.
	 * Not possible for a full list.
	 * @param 		element the element to be added to the list
	 */
	public void add(char elt) {
        if (this.end + 1 < this.list.length) {
            this.list[++this.end] = elt;
        }
	}

	/**
	 * Adds the specified element at the specified position in the list.
	 * Elements are shifted to the right to make room.
	 * Not possible for a full list.
	 * @param 		index the position in the list where the element will be added
	 * @param 		element the element to be added to the list
	 */
	public void add(int index, char elt) {
        if (index == this.end + 1) {
            this.add(elt);
        } else if (0 <= index && index <= this.end + 1 && this.end + 1 < this.list.length) {
            System.arraycopy(this.list, index, this.list, index + 1, ++this.end - index);
            this.list[index] = elt;
        }
	}

    /**
     * Check if an index is valid and within the bounds of the current list (compares with `(this.end + 1)`)
     * @return wheter it is a valid index
     */
    private boolean withinBounds(int index) {
        return 0 <= index && index < this.end + 1;
    }

	/**
	 * Returns the element at the specified index
	 * @param 		index the position in the list of the element we are getting
	 * @return 		the element at index
	 */
	public char get(int index) {
        return withinBounds(index) ? this.list[index] : '-';
	}

	/**
	 * Removes the element at the specified index.
	 * Elements are shifted to the left to fill in the space.
	 * Not possible for an empty list.
	 * @param 		index the position in the list of the element we are removing
	 */
	public void remove(int index) {
        if (withinBounds(index)) {
            System.arraycopy(this.list, index + 1, this.list, index, this.end-- + 1 - index);
        }
	}
 
	/**
	 * Replaces the element at the specified index with the element.
	 * Not possible for an empty list.
	 * @param 		index the position in the list of the element we are replacing
	 * @param 		elt the element replacing the existing element at index
	 */
	public void set(int index, char elt) {
        if (withinBounds(index)) {
            this.list[index] = elt;
        }
	}

	/**
	 * Returns the index of the first occurrence of the specified element.
	 * Returns -1 if the list does not contain the element.
	 * @param 		elt the element being searched for
	 * @return 		the index of element, or -1 if it doesn't exist
	 */
	public int indexOf(char elt) {
        for (int i = this.end; i-- > 0;) {
            if (elt == this.list[i]) {
                return i;
            }
        }
        return -1;
	}

	/**
	 * Sorts the list in ascending order using insertion sort.
	 */
	public void sort() {
        char c;
        for (int i = 1; i <= this.end; ++i) {
            for (int j = i; j > 0 && this.list[j - 1] > this.list[j]; this.list[--j] = c) {
                c = this.list[j];
                this.list[j] = this.list[j - 1];
            }
        }
	}

	/**
	 * Returns true if there are no elements in the list
	 * @return 		true if list is empty, false otherwise
	 */
    public boolean isEmpty() {
        return this.end == -1;
    }

	/**
	 * Returns true if the number of elements in the list is equal to MAX_SIZE
	 * @return 		true if list is full, false otherwise
	 */
    public boolean isFull() {
        return this.end + 1 == EasyList.MAX_SIZE;
    }
}
