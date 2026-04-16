# Proyecto: Integración Python + C + ARM64 Assembly

**Autor:** Bautsita Bautista Itzel - No.Control: 23212800  
**Arquitectura:** ARM64 (AArch64)  
**Plataforma:** AWS EC2 (Graviton) / Raspberry Pi OS

---

## 📋 Descripción

Este proyecto implementa una **librería de alto rendimiento** en ARM64 Assembly, integrada con Python mediante C y `ctypes`. Demuestra la interoperabilidad entre lenguajes de alto y bajo nivel, así como técnicas de optimización y profiling.

---

## 🎯 Objetivo

- Demostrar la integración Python → C → Assembly en ARM64
- Implementar rutinas optimizadas respetando el ABI de ARM64
- Analizar rendimiento comparativo (Python vs C vs Assembly)
- Aplicar debugging con GDB y profiling con `perf`

---

## 🛠️ Tecnologías

| Lenguaje/Herramienta | Propósito |
|---------------------|-----------|
| Python 3 | Interfaz principal y benchmarks |
| C (clang) | Bridge entre Python y Assembly |
| ARM64 Assembly | Rutinas optimizadas de bajo nivel |
| ctypes | Llamada a librería compartida |
| GDB | Depuración y análisis |
| perf | Profiling de rendimiento |

---

## 📁 Estructura del Proyecto
<code>
  Proyecto_ARM64_Python/
│
├── src/
│ ├── app.py # Interfaz Python + benchmarks
│ ├── bridge.c # Wrapper C (declaraciones)
│ └── ops.s # Implementación ARM64 Assembly
│
├── build/ # Librería compilada (.so)
├── .gitignore
├── evidencias/ # Capturas de GDB y ejecución
├── Makefile # Compilación automatizada
└── README.md # Este archivo
</code>

---

## ⚙️ Funcionalidades Implementadas

| Función | Descripción | Parámetros | Retorno |
|---------|-------------|------------|---------|
| `sum` | Suma de dos enteros | int a, int b | int |
| `sub` | Resta de dos enteros | int a, int b | int |
| `mul` | Multiplicación | int a, int b | int |
| `max` | Máximo de dos valores | int a, int b | int |
| `min` | Mínimo de dos valores | int a, int b | int |
| `sum_array` | Suma de arreglo | int* arr, int n | long |
| `count_even` | Conteo de números pares | int* arr, int n | int |
| `dot_product` | Producto punto vectorial | int* a, int* b, int n | long |

---

## 🚀 Compilación y Ejecución

### 1. Compilar la librería
```bash
/*
==========================================
Autor: Bautista Bautista Itzel
Proyecto: ARM64 High Performance Library
Archivo: ops.s
Descripción:
Implementación optimizada en ARM64
==========================================

C equivalente:

int sum(int a, int b) { return a + b; }

==========================================
*/

.text
.global sum
.global sub
.global mul
.global max
.global min
.global sum_array
.global count_even
.global dot_product

//--------------------------------------
// int sum(int a, int b)
// x0 = a, x1 = b
//--------------------------------------
sum:
    add x0, x0, x1
    ret

//--------------------------------------
sub:
    sub x0, x0, x1
    ret

//--------------------------------------
mul:
    mul x0, x0, x1
    ret

//--------------------------------------
max:
    cmp x0, x1
    csel x0, x0, x1, gt   // if x0 > x1
    ret

//--------------------------------------
min:
    cmp x0, x1
    csel x0, x0, x1, lt
    ret

//--------------------------------------
// long sum_array(int* arr, int n)
// x0 = ptr
// x1 = size
//--------------------------------------
sum_array:
    mov x2, 0        // i
    mov x3, 0        // sum

loop_sum:
    cmp x2, x1
    b.ge end_sum

    ldr w4, [x0, x2, lsl #2]
    add x3, x3, x4

    add x2, x2, 1
    b loop_sum

end_sum:
    mov x0, x3
    ret

//--------------------------------------
// count_even
//--------------------------------------
count_even:
    mov x2, 0
    mov x3, 0

loop_even:
    cmp x2, x1
    b.ge end_even

    ldr w4, [x0, x2, lsl #2]
    and x5, x4, 1
    cmp x5, 0
    cinc x3, x3, eq

    add x2, x2, 1
    b loop_even

end_even:
    mov x0, x3
    ret

//--------------------------------------
// dot_product
//--------------------------------------
dot_product:
    mov x3, 0
    mov x4, 0

loop_dot:
    cmp x4, x2
    b.ge end_dot

    ldr w5, [x0, x4, lsl #2]
    ldr w6, [x1, x4, lsl #2]
    mul x7, x5, x6
    add x3, x3, x7

    add x4, x4, 1
    b loop_dot

end_dot:
    mov x0, x3
    ret
```
### 2. C Bridge (bridge.c)
El archivo en C actúa como puente entre Python y Assembly, declarando las funciones externas implementadas en ensamblador.
```c
/*
==========================================
Bridge C -> ASM
==========================================
*/

#include <stdint.h>

// Declaraciones externas ASM
extern int sum(int, int);
extern int sub(int, int);
extern int mul(int, int);
extern int max(int, int);
extern int min(int, int);

extern long sum_array(int*, int);
extern int count_even(int*, int);
extern long dot_product(int*, int*, int);
```

---

### 3. Python Interface (app.py)

```python
import ctypes
import time
import random

lib = ctypes.CDLL("./build/libops.so")

# Configuración de tipos
lib.sum.argtypes = [ctypes.c_int, ctypes.c_int]
lib.sum.restype = ctypes.c_int

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
```
### 4.  Makefile
```
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
```
python3 src/app.py
---
<img width="647" height="80" alt="ejec" src="https://github.com/user-attachments/assets/13b729c4-f96e-495b-bb8d-ff5fee2cd2a4" />
<img width="789" height="436" alt="Captura de pantalla 2026-04-16 035920" src="https://github.com/user-attachments/assets/687693c1-7c39-46ef-ad70-919b5259183d" />

---
## Resultados Esperados
---
### Python
- Python puro	~0.01 s	1x (base)
  
### C
- C (optimizado con -O3)	~0.0005 s	~20x más rápido
  
### Assembly
- El código en Assembly es ~77 veces más rápido que Python equivalente

El código en Assembly es ~77 veces más rápido que Python equivalente
La suma de 100,000 elementos se completó en menos de 0.13 milisegundos
El overhead principal está en la llamada Python → ctypes → C → ASM
Para operaciones simples, el costo de llamada puede dominar; para loops grandes, Assembly brilla

## Resultados obtenidos en este proyecto
- ASM sum: 4,999,950,000
- Tiempo: 0.00012922286987304688 segundos
## Conclusiones
Los registros x0-x7 para argumentos y x0 para retorno facilitan la integración. Las instrucciones condicionales (csel, cinc) evitan branches y mejoran el pipeline. La integración Python-C-Assembly es viable y práctica ctypes permite llamar código de bajo nivel sin modificar Python.

El bridge en C es mínimo pero esencial para manejar tipos

## Autorreflexión
Este proyecto permitió comprender la interacción entre diferentes niveles de programación y cómo el control a bajo nivel impacta directamente en el rendimiento. En general mis conocimientos y entendimientos de GDB ya que lo que comprendi si es superficial, hace un dia no pasaba de entender algo completamente distinto a lo que era.
