CC=g++
INC_DIR=-Isrc/include/

# a build/lib/___.o for every src/lib/___.cpp
OBJS:=$(patsubst build/lib/%.o,src/lib/%.cpp,$(wildcard src/lib/*.cpp))

all: main
	echo "yep"

build/lib/%.o: src/lib/%.cpp build
	$(CC) -c -o $@ $< $(INC_DIR)

build:
	mkdir -p build/lib

# example of building a runnable target
main: build $(OBJS)
	$(CC) $(INC_DIR) -c src/main.cpp -o build/lib/main.o
	$(CC) $(INC_DIR) build/lib/main.o $(OBJS) -o build/run

clean:
	rm -rf build/
