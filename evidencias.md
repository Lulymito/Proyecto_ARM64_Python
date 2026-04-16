## Evidencias

| Figura | Descripción |
|--------|-------------|
| Figura 1 | Instalación de herramientas: `clang`, `make`, `gdb`, `git` |
| Figura 2 | Creación de la estructura del proyecto (`src/`, `build/`, archivos) |
| Figura 3 | Compilación exitosa con `make` |
| Figura 4 | Ejecución del benchmark: suma de 100,000 elementos en **0.0001s** |
| Figura 5 | Profiling con `perf`: **107,783,284 ciclos** de CPU |
| Figura 6 | GDB: breakpoints en funciones `sum` y `sum_array` |
| Figura 7 | GDB: inspección de registros - `x0=10`, `x1=20` (ABI ARM64) |
| Figura 8 | GDB: stepping con `stepi` - `x0` cambia de 10 a 30 |
| Figura 9 | GDB: `disassemble sum` - código Assembly en memoria |

---
## Creación de estructura de carpetas y archivos	Setup inicial
<img width="1084" height="164" alt="make" src="https://github.com/user-attachments/assets/94175845-3571-4275-bb65-130fb95bbd3f" />
(que despues fue corregida, pero no hay cap de dicha modificación)

## Instalación de herramientas (clang, make, gdb, git)	Configuración del entorno
<img width="732" height="105" alt="Captura de pantalla 2026-04-16 035803" src="https://github.com/user-attachments/assets/18a5573d-105e-4762-a364-5ec35fbf54bc" />

## Creación/edición del Makefile	Configuración de compilación
<img width="777" height="518" alt="Captura de pantalla 2026-04-16 035845" src="https://github.com/user-attachments/assets/1bc5f00d-1e90-48b7-b94a-f130a8ee8c91" />


## ls -la - Estructura antes de compilar	Verificación de archivos fuente
<img width="575" height="231" alt="Captura de pantalla 2026-04-16 041734" src="https://github.com/user-attachments/assets/47f7ae25-c5c3-4056-b42f-76003e25d8c2" />


## make clean && make - Compilación exitosa	Build del proyecto
<img width="647" height="289" alt="Captura de pantalla 2026-04-16 035859" src="https://github.com/user-attachments/assets/5edb5e7a-33d5-4873-aa01-da1f5e7139dd" />


## Ejecución normal: Tiempo: 0.0001s	Benchmark básico
<img width="647" height="80" alt="ejec" src="https://github.com/user-attachments/assets/2e87969a-1c10-4a8d-9107-b20db763afdd" />


## perf stat - Profiling detallado (107M cycles)	Análisis de rendimiento
<img width="789" height="436" alt="Captura de pantalla 2026-04-16 035920" src="https://github.com/user-attachments/assets/a46dcf05-a21d-406f-805a-271386f4c2b3" />


## GDB: breakpoints, registers, stepi	Depuración avanzada
<img width="746" height="608" alt="Captura de pantalla 2026-04-16 040555" src="https://github.com/user-attachments/assets/f22b1453-623d-4a45-b14d-fc0378e71dbf" />
<img width="566" height="730" alt="Captura de pantalla 2026-04-16 040624" src="https://github.com/user-attachments/assets/bb4b6bee-a446-4e19-a950-c7f9506be044" />
<img width="752" height="318" alt="Captura de pantalla 2026-04-16 041302" src="https://github.com/user-attachments/assets/6e1195ad-9e49-4911-bb4b-088b99d3d461" />


## disassemble sum - Código Assembly en GDB	Verificación del opcode
<img width="516" height="222" alt="Captura de pantalla 2026-04-16 040703" src="https://github.com/user-attachments/assets/20051f8b-46f7-44ce-bb0c-7d1b4988e751" />

