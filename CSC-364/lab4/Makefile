.PHONY: all
all: lab report.pdf

report.pdf: report.typ
	typst compile $<

lab: lab.c
	gcc -o lab lab.c
