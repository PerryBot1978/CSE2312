SRC=hw05.s
OBJ=.$(SRC:.s=.o)
EXE=$(SRC:.s=.e)

all : $(EXE)

clean : 
	fd "($(EXE)|$(OBJ))" --exec rm {}

$(EXE) : $(OBJ)
	arm-ld $(OBJ) -o $(EXE)

$(OBJ) : $(SRC)
	arm-as $(SRC) -g -o $(OBJ) 
