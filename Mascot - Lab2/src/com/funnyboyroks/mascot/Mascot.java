package com.funnyboyroks.mascot;

public class Mascot {
    private String name, type;
    private final int born;

    public Mascot(String name, String type, int year){
        this.name = name;
        this.type = type;
        this.born = year;
    }

    public Mascot(){this(null, null, 0);}

    public String toString(){
        return String.format("Mascot: Name: %s, Type: %s, Born: %s", name, type, born);
    }

    public String getName(){ return name; }
    public void setName(String name){ this.name = name; }

    public String getType(){ return type; }
    public void setType(String type) { this.type = type; }

    public int getBorn() { return born; }
    public int getAge() { return 2020 - born;}

    public String chant(){
        return String.format("Go %ss!", name);
    }
}
