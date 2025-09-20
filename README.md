# Optimización de carga de datos en NLP

Este proyecto compara diferentes estrategias de carga de datos (Pandas y PyTorch DataLoader)
para un dataset de 10 000 oraciones, midiendo **tiempo de ejecución y uso de RAM**,
con el objetivo de analizar los trade-offs entre in-memory y streaming.

## Objetivo

Evaluar cómo es el rendimiento (tiempo y memoria) al usar distintos métodos de carga de datos:

- Pandas (in-memory y streaming por chunks)
- PyTorch DataLoader (map-style con/sin shuffle, iterable)

## Métodos comparados

1. **Pandas in-memory**: carga completa en RAM.
2. **Pandas streaming**: lectura en chunks (`chunksize`).
3. **DataLoader map-style con shuffle**.
4. **DataLoader map-style sin shuffle**.
5. **DataLoader iterable-style**: lectura secuencial en streaming.

## Métricas

- `time_s`: tiempo total.
- `time_per_1k_samples_s`: tiempo normalizado (por 1000 muestras).
- `peak_ram_mb`: RAM pico durante la ejecución.
- `start_ram_mb`, `end_ram_mb`, `delta_ram_mb`: memoria inicial, final y diferencia.
- `batches`: número de batches procesados.
- `stable_shuffle`: 1 si hay barajado reproducible.

## Conclusiones

- Pandas full fue el más rápido en dataset pequeño (10k), pero con mayor uso de RAM.
- Pandas streaming mantuvo RAM estable, a costa de más tiempo.
- DataLoader map-style sin shuffle fue el más eficiente en tiempo.
- IterableDataset mostró rendimiento intermedio, pero es el más escalable a datasets grandes.
- Shuffle introduce un ligero aumento de tiempo y RAM, pero es esencial para entrenamiento en modelos.
