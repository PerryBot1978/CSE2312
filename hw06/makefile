SRC=driver06.c
FUN=hw06.s
EXE=hw06.e

all : $(EXE)

clean : 
	fd \\.[oe] --exec-batch rm {}

$(EXE) : $(SRC) $(FUN)
	arm-gcc $(SRC) $(FUN) -g -o $(EXE)

