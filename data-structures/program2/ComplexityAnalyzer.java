import java.util.List;
import java.util.ArrayList;
/*
* Name:   Hayden Pott
* Date:   15 Sept 2023
* Course: CSC 220 - Data Structures
*/
public class ComplexityAnalyzer extends AbstractComplexityAnalyzer {
    // Set of names of the functions.  These map to the values in ComplexityAnalyzer#analyzeComplexity
    private static final String[] NAMES = { "Constant", "Logarithmic", "Linear", "Quasi-Linear", "Quadratic", "Cubic", "Exponential" };

    /**
    * Returns a String containing the names of the functions that could have
    * possibly generated the output given the input
    * @param input number
    * @param output number
    * @return names of possible functions
    */
    public String analyzeComplexity(double input, double output) {
        // The set of values to test against
        double[] values = { 1, Math.log(input) / Math.log(2), input, input * Math.log(input) / Math.log(2), input * input, Math.pow(input, 3), Math.pow(2, input) };

        // The list of matches
        List<String> out = new ArrayList<>();
        
        // Loop over the values, if one matches, then we can add the name to our list
        for (int i = 0; i < values.length; ++i) {
            if (output == values[i]) {
                out.add(NAMES[i]);
            }
        }

        // Join the list with ", "
        return String.join(", ", out);
    }
}
