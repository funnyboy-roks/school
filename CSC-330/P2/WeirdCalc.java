import org.antlr.v4.runtime.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.io.IOException;
import java.util.HashMap;

public class WeirdCalc {
    public static HashMap<String, Integer> env;

    public static void main(String[] args) {
        String sourceFilePath = "source.wc";
        try {
            if (args.length > 0) {
                sourceFilePath = args[0];
            }
            String fileContents = Files.readString(Path.of(sourceFilePath));
            var lexer = new WeirdCalcLexer(CharStreams.fromString(fileContents));
            var parser = new WeirdCalcParser(new CommonTokenStream(lexer));
            parser.program();
        } catch (IOException _) {
            System.err.println("couldn't read from source file " + sourceFilePath);
        }
    }
}
