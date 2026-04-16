CC = clang
CFLAGS = -fPIC -O2 -Wall -g
LDFLAGS = -shared

SRC_DIR = src
BUILD_DIR = build

all: $(BUILD_DIR)/libops.so

$(BUILD_DIR)/libops.so: ops.o bridge.o
	@mkdir -p $(BUILD_DIR)
	$(CC) $(LDFLAGS) -o $@ $^

ops.o: $(SRC_DIR)/ops.s
	$(CC) $(CFLAGS) -c $< -o $@

bridge.o: $(SRC_DIR)/bridge.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o $(BUILD_DIR)/*.so

.PHONY: all clean
