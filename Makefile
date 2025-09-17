.PHONY: all clean lang-jp lang-en demo

export TEXINPUTS=.;lang/jp;lang/en;${CURDIR};
xelatex := xelatex -shell-escape

ifeq ($(OS),Windows_NT)
	CURRENT_DATE := $(shell powershell -Command "Get-Date -Format 'yyyy-MM-dd'")
else
	CURRENT_DATE := $(shell date +"%Y-%m-%d")
endif

all: lang

clean:
	rm -f *.aux *.log *.out *.pdf
	cd lang/jp && rm -f *.aux *.log *.out *.pdf
	cd lang/en && rm -f *.aux *.log *.out *.pdf
	cd lang && rm -f *.aux *.log *.out *.pdf


demo:
	xelatex demo.tex && xelatex demo.tex && xelatex demo.tex

# lang: lang-jp lang-en
# 	cd lang && xelatex doc.tex && xelatex doc.tex && xelatex doc.tex

# lang-jp:
# 	cd lang/jp && xelatex doc.tex && xelatex doc.tex && xelatex doc.tex

# lang-en:
# 	cd lang/en && xelatex doc.tex && xelatex doc.tex && xelatex doc.tex
