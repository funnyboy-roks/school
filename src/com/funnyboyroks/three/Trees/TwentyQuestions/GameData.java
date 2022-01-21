package com.funnyboyroks.three.Trees.TwentyQuestions;

public record GameData(String data, boolean question) {

    @Override
    public String toString() {
        return (question ? "Q:" : "A:") + data;
    }
}
