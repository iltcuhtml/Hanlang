CC = gcc
PP = g++

C_SOURCE = src
H_SOURCE = src
TEST_SOURCE = test

OBJECT = obj
EXECUTABLE = exe

CFLAGS = -std=c++23 -Wall -Werror -Wextra -O3 -I$(H_SOURCE) -static

$(OBJECT):
	mkdir $(OBJECT)

$(EXECUTABLE):
	mkdir $(EXECUTABLE)

# all -> jschlang
all: $(OBJECT)/main.o | $(EXECUTABLE)/jschlang

# jschlang
$(EXECUTABLE)/jschlang: $(OBJECT)/main.o | $(EXECUTABLE)
	$(PP) $(CFLAGS) $(OBJECT)/main.o $(C_GAME_LIBRARY_FILES) -o $(EXECUTABLE)/jschlang
	strip $(EXECUTABLE)/jschlang.exe

# main.cpp
$(OBJECT)/main.o: $(C_SOURCE)/main.cpp | $(OBJECT)
	$(PP) $(CFLAGS) -c $(C_SOURCE)/main.cpp -o $(OBJECT)/main.o

obj_clean:
	del /Q obj\*

out_clean:
	del /Q out