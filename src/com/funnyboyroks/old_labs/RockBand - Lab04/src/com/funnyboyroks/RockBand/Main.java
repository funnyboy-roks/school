package com.funnyboyroks.RockBand;

public class Main {

    public static void main(String[] args) {
	// write your code here
        RockBand band = new RockBand("Hello World", "hi");
        band.addMember("tada");
        band.increaseFans(10000);
        System.out.println(band.numTourDates());
        System.out.println(band.toString());
    }
}
