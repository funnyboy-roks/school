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
        this.end = 0;
	}

	/**
	 * Copy constructor - constructs an EasyList whose elements are copied from
	 * the given EasyList
	 * @param		el EasyList to copy from
	 */
	public EasyList(EasyList el) {
        this.end = el.size();
        this.list = new char[EasyList.MAX_SIZE];
        for(int i = this.end; --i >= 0;) {
            this.list[i] = el.get(i);
        }
	}

	/**
	 * Returns the number of elements in the list (not the max capacity)
	 * @return 		number of elements in list
	 */
	public int size() {
		return this.end;
	}

    private static char[] subArr(char[] arr, int len) {
        char[] out = new char[len];
        for (int i = len; --i >= 0;) {
            out[i] = arr[i];
        }
        return out;
    }

    private static String[] toStringArr(char[] arr) {
        String[] out = new String[arr.length];
        for(int i = arr.length; --i >= 0;) {
            out[i] = arr[i] + "";
        }
        return out;
    }

	/**
	 * Returns a String representation of the list ("NULL" if empty)
	 * @return 		String representation of list
	 */
    @Override
	public String toString() {
        if (this.end != 0) {
            // Form the String
            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < this.end; ++i) {
                sb.append(this.list[i]);
                if (i != this.end - 1) {
                    sb.append(", ");
                }
            }
            return "[" + sb + "]";
        }
        return "NULL";
	}

	/**
	 * Adds the specified element to the end of the list.
	 * Not possible for a full list.
	 * @param 		element the element to be added to the list
	 */
	public void add(char elt) {
        if (this.end < this.list.length) {
            this.list[this.end++] = elt;
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
        if (index == this.end) {
            this.add(elt);
        } else if (index >= 0 && this.end < this.list.length && index <= this.end) {
            System.arraycopy(this.list, index, this.list, index + 1, this.end++ - index);
            this.list[index] = elt;
        }
	}

    /**
     * Check if an index is valid and within the bounds of the current list (compares with `this.end`)
     * @return wheter it is a valid index
     */
    private boolean withinBounds(int index) {
        return index >= 0 && index < this.end;
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
            System.arraycopy(this.list, index + 1, this.list, index, this.end-- - index);
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
        for (int i = this.end; --i >= 0;) {
            if (elt  == this.list[i]) {
                return i;
            }
        }
        return -1;
	}

	/**
	 * Sorts the list in ascending order using bubble sort.
	 */
	public void sort() {
        boolean swapped = true;
        while (swapped) {
            swapped = false;
            for(int i = this.end; --i >= 1;) {
                if (this.list[i - 1] > this.list[i]) {
                    // Swap the numbers
                    var c = this.list[i - 1];
                    this.list[i - 1] = this.list[i];
                    this.list[i] = c;

                    swapped = true;
                }
            }
        }
	}

    public boolean isEmpty() {
        return this.end == 0;
    }

    public boolean isFull() {
        return this.end == this.list.length;
    }
}
