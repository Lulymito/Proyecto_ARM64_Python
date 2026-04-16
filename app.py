import ctypes
import time
import random

lib = ctypes.CDLL("./build/libops.so")

# Configuración de tipos
lib.sum.argtypes = [ctypes.c_int, ctypes.c_int]
lib.sum.restype = ctypes.c_int

lib.sum_array.argtypes = [ctypes.POINTER(ctypes.c_int), ctypes.c_int]
lib.sum_array.restype = ctypes.c_long

# Test simple
print("SUM:", lib.sum(10, 20))

# Benchmark
def benchmark():
    size = 100000
    arr = (ctypes.c_int * size)(*range(size))

    start = time.time()
    result = lib.sum_array(arr, size)
    end = time.time()

    print("ASM sum:", result)
    print("Tiempo:", end - start)

benchmark()
