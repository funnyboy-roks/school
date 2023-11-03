/*
Name:     	[Your Name Here]
Date:       [Current Date Here]
Course:     CSC 220 - Data Structures
*/

public class KVPair {

    public String k;
    public double v;

	/**
	 * Constructor
	 * @param			k - the key to store in the KVPair
	 * @param			v - the value to store in the KVPair
	 */
	public KVPair(String k, double v) {
        this.k = k;
        this.v = v;
	}

	// Getter and setter methods
    public String getKey() {
        return this.k;
    }

    public double getValue() {
        return this.v;
    }

    public void setK(String k) {
        this.k = k;
    }

    public void setK(double v) {
        this.v = v;
    }

	/**
	 * Returns the string representation of the key/value pair
	 * @return 			the String representation of the KVPair
	 */
	public String toString() {
		return k + " | " + v;
	}
}
