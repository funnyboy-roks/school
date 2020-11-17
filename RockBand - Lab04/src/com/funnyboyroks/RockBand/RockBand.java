package com.funnyboyroks.RockBand;

import java.util.ArrayList;
import java.util.Arrays;

public class RockBand {
    private String name;
    private ArrayList<String> members = new ArrayList<>();
    private int fans;

    public RockBand(String name, String[] members){
        this.members.addAll(Arrays.asList(members));
        this.name = name;
        this.fans = 1;
    }
    public RockBand(String name, String member){
        this.members.add(member);
        this.name = name;
        this.fans = 1;
    }

    public String toString(){
        return String.format("Band Name: %s\nMembers: %s\nNumber of Fans: %s", name, members.toString(), fans);
    }

    public String getName() {
        return name;
    }

    public ArrayList<String> getMembers() {
        return members;
    }

    public int getFans() {
        return fans;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void addMember(String member){
        members.add(member);
    }
    public void removeMember(String member){
        members.remove(member);
    }
    public void increaseFans(int gigs){
        fans += gigs * members.size();
    }
    public void decreaseFans(int fans){
        this.fans -= fans;
    }

    public boolean isAmazing(){
        return fans >= 10_000 * members.size();
    }

    public int numTourDates(){
        if(fans < 100_000){
            if(fans < 10_000){
                increaseFans(members.size());
                return members.size();
            }
            increaseFans(members.size() * 2);
            return members.size() * 2;
        }
        int r = (int) Math.floor(Math.random() * 35) + 13;
        increaseFans(r);
        return r;
    }
}
