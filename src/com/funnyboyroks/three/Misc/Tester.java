package com.funnyboyroks.three.Misc;

import java.util.function.Function;

/**
 * Class to assist in testing
 */
public class Tester {

    public final boolean DEBUG = false;

    /**
     * @param fn Function to run
     * @return The value returned by method or null if error thrown
     */
    public <T> T runSafe(Function<Integer, T> fn) {
        try {
            return fn.apply(0);
        } catch (Exception e) {
            if (DEBUG) e.printStackTrace();
            return null;
        }

    }

}
