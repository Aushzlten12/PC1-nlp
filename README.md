# Optimización de carga de datos

## **Temas**: Carga de datos, bibliotecas básicas.

### **Implementación**:

Compara Pandas vs. PyTorch DataLoader para cargar nlp_prueba_cc0c2_large.csv (10,000 oraciones). Mide tiempo y RAM (con psutil) para lectura completa vs. batching (batch_size=32). Usa collate_fn para padding simple. Fija semillas.
