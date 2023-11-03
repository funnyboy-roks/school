/*
* Author:     TJ Bowman
* Date:       7/29/2023
* Course:     CSC 220 - Data Structures
*/

public abstract class AbstractDictionary {

	public final int MAX_SIZE = 10;			// Maximum number of KVPairs the dictionary can store
	protected KVPair DELETED;				// Used to mark KVPairs deleted from the dictionary
	protected KVPair[] hashTable;			// The hashTable array used as the backend storage
	protected int numKVPairs;				// The number of KVPairs in the dictionary (excluding null and DELETED)

	// Returns true if the Dictionary is empty or full, respectively
	public abstract boolean isEmpty();
	public abstract boolean isFull();

	/**
	 * Returns the number of key-value pairs in the dictionary
	 * @return 			the number of key-value pairs
	 */
	public abstract int getSize();

	/**
	 * Returns a vertical string representation of the dictionary's hash table
	 * This includes null and deleted KVPairs
	 * @return 			String representation of the dictionary's hash table
	 */
	public abstract String toString();

	/**
	 * Adds the key and value given to the dictionary as a KVPair by storing it in its proper position
	 * in the backend hash table.  Uses open addressing with linear probing to handle collisions.
	 * @param			key - the key of the KVPair to be added to the dictionary
	 * @param			value - the value of the KVPair to be added to the dictionary
	 */
	public abstract void add(String key, double value);

	/**
	 * Returns the value stored in the Dictionary for the given key
	 * @param			key - the key of the KVPair to lookup in the dictionary
	 * @return 			the value of the KVPair containing key
	 */
	public abstract double get(String key);

	/**
	 * Removes the KVPair associated with the given key
	 * @param			key - the key of the KVPair to remove from the dictionary
	 */
	public abstract void remove(String key);
}
