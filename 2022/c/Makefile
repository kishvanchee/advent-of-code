OUTPUTDIR = ./build
DAY = day01
FLAGS = -std=c99 -pedantic -Wall -O3 -Wextra
DATADIR = ../data

$(OUTPUTDIR)/%.o: %.c
	@mkdir -p $(@D)
	gcc $(FLAGS) -o $@ -c $<

$(OUTPUTDIR)/day%: day%.c utils.h $(OUTPUTDIR)/utils.o
	@mkdir -p $(@D)
	gcc $(FLAGS) -o $@ $< $(OUTPUTDIR)/utils.o

all: run

.PHONY: run
run: $(OUTPUTDIR)/$(DAY)
	$< < $(DATADIR)/$(DAY).txt

.PHONY: sample
sample: $(OUTPUTDIR)/$(DAY)
	$< < $(DATADIR)/$(DAY)-sample.txt

clean:
	rm -rf $(OUTPUTDIR)
