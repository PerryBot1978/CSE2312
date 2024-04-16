SRC1=hw02a.s
OBJ1=.$(SRC1:.s=.o)
EXE1=$(SRC1:.s=.e)

SRC2=hw02b.s
OBJ2=.$(SRC2:.s=.o)
EXE2=$(SRC2:.s=.e)

all : $(EXE1) $(EXE2)

clean : 
	fd "\\.[eo]" --exec rm {}

$(EXE1) : $(OBJ1)
	arm-ld $(OBJ1) -o $(EXE1)

$(OBJ1) : $(SRC1)
	arm-as $(SRC1) -g -o $(OBJ1) 

$(EXE2) : $(OBJ2)
	arm-ld $(OBJ2) -o $(EXE2)

$(OBJ2) : $(SRC2)
	arm-as $(SRC2) -g -o $(OBJ2) 
