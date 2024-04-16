SRC=test.c
EXE=$(SRC:.c=.e)

ASM1=mathy.s
OBJ1=$(ASM1:.s=.o)

all : $(EXE)

clean : 
	fd "\\.[eo]" --exec rm {}

$(EXE) : $(SRC) ../lib/lib.o $(OBJ1)
	arm-gcc -g -o $(EXE) $(SRC) $(OBJ1) ../lib/lib.o -O3

../lib/lib.o : 
	( cd ../lib ; $(MAKE) )

$(OBJ1) : $(ASM1)
	arm-as $(ASM1) -g -o $(OBJ1)

