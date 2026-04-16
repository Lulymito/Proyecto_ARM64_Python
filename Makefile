CC=clang
CFLAGS=-fPIC -O2 -Wall -g
LDFLAGS=-shared

BUILD=build

all: $(BUILD)/libops.so

$(BUILD)/libops.so: ops.o bridge.o
	$(CC) $(LDFLAGS) -o $@ $^

ops.o: ops.s
	$(CC) $(CFLAGS) -c ops.s

bridge.o: bridge.c
	$(CC) $(CFLAGS) -c bridge.c

clean:
	rm -f *.o $(BUILD)/*.so
