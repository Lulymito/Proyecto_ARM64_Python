# Proyecto: Integración Python + C + ARM64 Assembly

**Autor:** Lulymito  
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
