SRC=test.s
OBJ=$(SRC:.s=.o)
EXE=$(SRC:.s=.e)

all : $(EXE)

clean : 
	fdfind "\\.[eo]" --exec-batch rm {}

$(OBJ) : $(SRC)
	arm-as $(SRC) -o $(OBJ) -mfpu=vfpv3

$(EXE) : $(OBJ)
	arm-gcc -g $(OBJ) -o $(EXE) -mfpu=vfpv3 -O3

