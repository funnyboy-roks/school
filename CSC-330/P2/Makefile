ANTLR_JAVA_OUT=WeirdCalcBaseListener.java  WeirdCalcLexer.java  WeirdCalcListener.java  WeirdCalcParser.java
ANTLR_OUT=$(ANTLR_JAVA_OUT) WeirdCalc.interp WeirdCalc.tokens WeirdCalcLexer.interp WeirdCalcLexer.tokens
ANTLR_VERSION=4.13.2
ANTLR_RUNTIME_JAR=antlr-runtime-$(ANTLR_VERSION).jar
ANTLR_COMPLETE_JAR=antlr-$(ANTLR_VERSION)-complete.jar

WeirdCalc: WeirdCalc.class

$(ANTLR_RUNTIME_JAR):
	wget https://www.antlr.org/download/$(ANTLR_RUNTIME_JAR)

antlr-$(ANTLR_VERSION)-complete.jar:
	wget https://www.antlr.org/download/$(ANTLR_COMPLETE_JAR)

WeirdCalc.class: $(ANTLR_RUNTIME_JAR) WeirdCalc.java $(ANTLR_JAVA_OUT)
	CLASSPATH=".:$(ANTLR_RUNTIME_JAR)" javac *.java

$(ANTLR_OUT): $(ANTLR_COMPLETE_JAR) WeirdCalc.g
	java -jar $(ANTLR_COMPLETE_JAR) WeirdCalc.g

clean:
	rm *.class $(ANTLR_OUT) $(ANTLR_RUNTIME_JAR) $(ANTLR_COMPLETE_JAR) || true
