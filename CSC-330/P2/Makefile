ANTLR_JAVA_OUT=WeirdCalcBaseListener.java  WeirdCalcLexer.java  WeirdCalcListener.java  WeirdCalcParser.java
ANTLR_OUT=$(ANTLR_JAVA_OUT) WeirdCalc.interp WeirdCalc.tokens WeirdCalcLexer.interp WeirdCalcLexer.tokens
ANTLR_RUNTIME_JAR=antlr-runtime-4.13.2.jar

WeirdCalc: WeirdCalc.class

$(ANTLR_RUNTIME_JAR):
	wget https://www.antlr.org/download/$(ANTLR_RUNTIME_JAR)

WeirdCalc.class: $(ANTLR_RUNTIME_JAR) WeirdCalc.java $(ANTLR_JAVA_OUT)
	CLASSPATH=".:$(ANTLR_RUNTIME_JAR)" javac *.java

antlr: $(ANTLR_OUT)

$(ANTLR_OUT): WeirdCalc.g
	antlr4 WeirdCalc.g

clean:
	rm *.class $(ANTLR_OUT) antlr-runtime-4.13.2.jar || true
