/*
Author: TJ Bowman
Date: 7/29/2023
Course: CSC 220 - Data Structures
*/
public abstract class AbstractComplexityAnalyzer {
/**
* Returns a String containing the names of the functions that could have
* possibly generated the output given the input
* @param input number
* @param output number
* @return names of possible functions
*/
public abstract String analyzeComplexity(double input, double output);
}
