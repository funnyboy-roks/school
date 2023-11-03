/*
Name:    Hayden Pott
Date:    03 Nov 2023
Course:  CSC 220 - Data Structures
*/

public class Dictionary extends AbstractDictionary {

    private static int asciiSum(String s) {
        // can't do s.chars().sum() because old java :(
        int o = 0;
        for(int i = s.length(); i-- > 0; o += s.charAt(i));
        return o;
    }

    /**
     * Default Constructor
     */
    public Dictionary() {
        this.DELETED = new KVPair(null, Double.NEGATIVE_INFINITY);
        this.hashTable = new KVPair[this.MAX_SIZE];
    }

    public boolean isEmpty() {
        return this.numKVPairs == 0;
    }

    public boolean isFull() {
        return this.numKVPairs == this.MAX_SIZE;
    }

    /**
     * Returns the number of key-value pairs in the dictionary
     * @return             the number of key-value pairs
     */
    public int getSize() {
        return this.numKVPairs;
    }

    /**
     * Returns a vertical string representation of the dictionary's hash table
     * This includes null and deleted KVPairs
     * @return             String representation of the dictionary's hash table
     */
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < this.hashTable.length; ++i) {
            KVPair entry = this.hashTable[i];
            if (entry == DELETED) {
                sb.append("-DELETED-");
            } else if (entry == null) {
                sb.append("-NULL-");
            } else {
                sb.append(entry);
            }
            sb.append('\n');
        }
        return sb.toString();
    }

    /**
     * Adds the key and value given to the dictionary as a KVPair by storing it in its proper position
     * in the backend hash table.  Uses open addressing with linear probing to handle collisions.
     * @param            key - the key of the KVPair to be added to the dictionary
     * @param            value - the value of the KVPair to be added to the dictionary
     */
    public void add(String key, double value) {
        if (this.isFull()) return;

        int hash = asciiSum(key) % this.hashTable.length;
        KVPair entry = this.hashTable[hash];

        if (entry != null && entry != DELETED) { // we must probe
            while((entry = this.hashTable[hash = ++hash % this.hashTable.length]) != null && entry != DELETED);
        }

        // Create the new entry
        this.hashTable[hash] = new KVPair(key, value);
        ++this.numKVPairs;
    }

    /**
     * Returns the value stored in the Dictionary for the given key
     * @param            key - the key of the KVPair to lookup in the dictionary
     * @return             the value of the KVPair containing key
     */
    public double get(String key) {
        if (this.isEmpty()) return -1;
        int hash, oghash;
        hash = oghash = asciiSum(key) % this.hashTable.length;
        KVPair entry = this.hashTable[hash];
        // No entry, so return -1
        if (entry == null) return -1;
        // The entry is the correct key so let's return
        if (entry != DELETED && entry.getKey().equals(key)) return entry.getValue(); 

        // we must probe
        while((entry = this.hashTable[hash = ++hash % this.hashTable.length]) != null && hash != oghash && (entry == DELETED || !entry.getKey().equals(key)));

        // the entry does not exist
        if (entry == null || entry == DELETED) return -1;

        return entry.getValue();
    }

    /**
     * Removes the KVPair associated with the given key
     * @param            key - the key of the KVPair to remove from the dictionary
     */
    public void remove(String key) {
        if (this.isEmpty()) return;

        int hash, oghash;
        hash = oghash = asciiSum(key) % this.hashTable.length;

        KVPair entry = this.hashTable[hash];

        // There is no entry
        if (entry == null) return;

        // The entry is this correct key, so let's remove the value and return
        if (entry != DELETED && entry.getKey().equals(key) && (this.hashTable[hash] = DELETED) != null && --this.numKVPairs >= 0) return;

        // we must probe
        while((entry = this.hashTable[hash = ++hash % this.hashTable.length]) != null && hash != oghash && (entry == DELETED || !entry.getKey().equals(key)));

        if (entry == null || hash == oghash) return; // the entry does not exist
        this.hashTable[hash] = DELETED;
        --this.numKVPairs;
    }
}
