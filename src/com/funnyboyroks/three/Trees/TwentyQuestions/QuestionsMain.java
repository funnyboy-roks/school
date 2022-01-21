package com.funnyboyroks.three.Trees.TwentyQuestions;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Scanner;

public class QuestionsMain {

    public static void main(String[] args) throws IOException {
        Scanner console = new Scanner(System.in);

        System.out.println("Welcome to CSE 143 Game of N-Questions!");
        System.out.println();

        System.out.print("Which questions file would you like to use? ");
        String filename = console.nextLine().trim();

        /* Create the Questions File if it doesn't exist */
        File questionsFile = new File(filename);
        if (!questionsFile.exists()) {
            questionsFile.createNewFile();
        }

        Scanner questions = new Scanner(questionsFile);
        QuestionsGame game = createGame(questions, console);

        System.out.print("Let's play!  ");
        do {
            System.out.println("Please choose your object, and I'll " +
                               "start guessing.");
            System.out.println("Press Enter when you're ready to begin!");
            console.nextLine();
            game.play();
            System.out.println();
            game.save(new PrintStream(questionsFile));
            System.out.print("Do you want to play again (y/n)? ");
        } while (console.nextLine().trim().toLowerCase().startsWith("y"));
    }

    public static QuestionsGame createGame(Scanner questions, Scanner console) {
        /* Check if the file has anything in it.  If it does, use it.
         * Otherwise, initialize a new game. */
        if (!questions.hasNext()) {
            return new QuestionsGame(getInitialObject(console));
        } else {
            return new QuestionsGame(questions);
        }
    }

    public static String getInitialObject(Scanner console) {
        System.out.println("There are no objects to guess in that questions file.");
        System.out.print("Can you provide me with an initial object? ");
        return console.nextLine().toLowerCase().trim();
    }
}