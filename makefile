_SOURCES = card.cpp deck.cpp
_OBJECTS = card.o deck.o poker.o
_BINS = poker

SRC_DIR = ./src
OBJ_DIR = ./obj
BIN_DIR = ./bin
INC_DIR = ./include

FLAGS = -I$(INC_DIR) -Wall -Wextra -std=c++17
CC = g++

SOURCES = $(patsubst %,$(SRC_DIR)/%,$(_SOURCES))
OBJECTS = $(patsubst %,$(OBJ_DIR)/%,$(_OBJECTS))
BINS = $(patsubst %,$(BIN_DIR)/%,$(_BINS))

all: $(BINS)

clean:
	rm -f $(OBJ_DIR)/* $(BIN_DIR)/*

$(BINS): $(OBJECTS)
	$(CC) $(FLAGS) -o $@ $^

$(OBJECTS):$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(FLAGS) -c $< -o $@
