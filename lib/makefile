SRC1=atoi.s
SRC2=itoa.s
SRC3=math.s

OBJ1=./obj/$(SRC1:.s=.o)
OBJ2=./obj/$(SRC2:.s=.o)
OBJ3=./obj/$(SRC3:.s=.o)

all : lib.o

lib.o : $(OBJ1) $(OBJ2) $(OBJ3)
	arm-ld $(OBJ1) $(OBJ2) $(OBJ3) -r -o lib.o
	chmod -x lib.o

clean : 
	fdfind "\\.o" --exec-batch rm {}

$(OBJ1) : $(SRC1)
	arm-as -g $(SRC1) -o $(OBJ1) -mfpu=vfpv3

$(OBJ2) : $(SRC2)
	arm-as -g $(SRC2) -o $(OBJ2) -mfpu=vfpv3

$(OBJ3) : $(SRC3)
	arm-as -g $(SRC3) -o $(OBJ3) -mfpu=vfpv3

