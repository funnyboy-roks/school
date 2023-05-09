package com.funnyboyroks;

import java.util.Arrays;
import java.util.Objects;

public class GameCharacter {

    public static final int MAX_LIVES = 5;


    private String   name;
    private int      lives;
    private String[] inventory;

    public GameCharacter(String name, int lives) {
        this.name = name;
        this.lives = lives;
        this.inventory = new String[5];
    }

    public GameCharacter() {
        this("Sam Sung", GameCharacter.MAX_LIVES);
    }

    public boolean isAlive() {
        return this.lives > 0;
    }

    public boolean hasWeapon() {
        return Arrays.stream(this.inventory).anyMatch(c -> c != null && (c.equalsIgnoreCase("knife") || c.equalsIgnoreCase("gun")));
    }

    public int sizeOfInventory() {
        return (int) Arrays.stream(this.inventory).filter(Objects::nonNull).count();
    }

    public void heal() {
        this.lives = GameCharacter.MAX_LIVES;
    }

    public void damage() {
        if (this.isAlive()) {
            this.lives -= 1;
        }
    }

    public void pickUp(String item) {
        for (int i = 0; i < this.inventory.length; i++) {
            if (this.inventory[i] == null) {
                this.inventory[i] = item;
                return;
            }
        }
    }

    public void drop(String item) {
        for (int i = 0; i < this.inventory.length; i++) {
            if (this.inventory[i] != null && this.inventory[i].equalsIgnoreCase(item)) {
                this.inventory[i] = null;
                return;
            }
        }
    }

    @Override
    public String toString() {
        return "GameCharacter{" +
               "name='" + name + '\'' +
               ", lives=" + lives +
               ", inventory=" + Arrays.toString(Arrays.stream(inventory).filter(Objects::nonNull).toArray(String[]::new)) +
               '}';
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLives() {
        return this.lives;
    }

    public void setLives(int lives) {
        this.lives = Math.min(Math.max(lives, 0), GameCharacter.MAX_LIVES);
    }

    public String[] getInventory() {
        return this.inventory;
    }

    public void setInventory(String[] inv) {
        this.inventory = inv;
    }
}
