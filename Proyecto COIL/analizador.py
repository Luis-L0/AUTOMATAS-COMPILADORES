import tkinter as tk
from tkinter import filedialog, messagebox, ttk
import tkinter.font as tkFont

# Lista de regionalismos colombianos
REGIONALISMOS = [
    "chuta", "lodero", "chagra", "choclos", "ollocos",
    "chumado", "aljibe", "entundarse", "chapíl", "chapil",
    "chagras", "marraneras", "cuyeras", "desgualangado",
    "emberracado", "chalina", "empantanada", "barones",
    "charuco", "chancuco", "Taitas", "guaguas", "baroncitos",
    "zurrón", "pomas", "enruanados", "azaroso", "bramo",
    "manga", "bambarito", "enajenación", "tuste"
]

class AnalizadorApp:
    def __init__(self, ventana):
        self.ventana = ventana
        self.ventana.title("Analizador de Regionalismos Colombianos")
        self.ventana.geometry("750x600")
        self.ventana.resizable(True, True)
        
        # Colores
        self.color_fondo = "#F5F7FA"
        self.color_primario = "#2563EB"
        self.color_exito = "#10B981"
        self.color_advertencia = "#F59E0B"
        
        self.ventana.config(bg=self.color_fondo)
        
        self.resultados_actuales = {}
        self.total_actual = 0
        
        self._crear_interfaz()
    
    def _crear_interfaz(self):
        # Encabezado
        encabezado = tk.Frame(self.ventana, bg=self.color_primario, height=60)
        encabezado.pack(fill=tk.X, padx=0, pady=0)
        
        titulo = tk.Label(
            encabezado, 
            text="Analizador de Regionalismos Colombianos",
            bg=self.color_primario, fg="white",
            font=("Arial", 14, "bold")
        )
        titulo.pack(pady=15)
        
        # Marco de opciones
        marco_opciones = tk.Frame(self.ventana, bg=self.color_fondo)
        marco_opciones.pack(fill=tk.X, padx=15, pady=15)
        
        # Botones
        boton_archivo = tk.Button(
            marco_opciones, text="📂 Cargar archivo", 
            command=self._subir_archivo,
            bg=self.color_primario, fg="white",
            font=("Arial", 10, "bold"),
            padx=15, pady=8, relief=tk.FLAT, cursor="hand2"
        )
        boton_archivo.pack(side=tk.LEFT, padx=5)
        
        boton_limpiar = tk.Button(
            marco_opciones, text="🗑️ Limpiar",
            command=self._limpiar,
            bg=self.color_advertencia, fg="white",
            font=("Arial", 10, "bold"),
            padx=15, pady=8, relief=tk.FLAT, cursor="hand2"
        )
        boton_limpiar.pack(side=tk.LEFT, padx=5)
        
        # Búsqueda en tiempo real
        marco_busqueda = tk.Frame(self.ventana, bg=self.color_fondo)
        marco_busqueda.pack(fill=tk.X, padx=15, pady=10)
        
        tk.Label(marco_busqueda, text="🔎 Filtrar:", bg=self.color_fondo,
                font=("Arial", 10)).pack(side=tk.LEFT, padx=5)
        
        self.entrada_filtro = tk.Entry(
            marco_busqueda, width=30, 
            font=("Arial", 10),
            relief=tk.FLAT,
            bd=2
        )
        self.entrada_filtro.pack(side=tk.LEFT, padx=5, fill=tk.X, expand=True)
        self.entrada_filtro.bind("<KeyRelease>", lambda e: self._actualizar_filtro())
        
        # Tabla de resultados
        marco_tabla = tk.Frame(self.ventana, bg=self.color_fondo)
        marco_tabla.pack(fill=tk.BOTH, expand=True, padx=15, pady=10)
        
        # Barra de desplazamiento
        scrollbar = ttk.Scrollbar(marco_tabla)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        
        self.tabla = ttk.Treeview(
            marco_tabla, 
            columns=("Palabra", "Cantidad"),
            show="headings",
            height=15,
            yscrollcommand=scrollbar.set
        )
        scrollbar.config(command=self.tabla.yview)
        
        self.tabla.heading("Palabra", text="Palabra encontrada")
        self.tabla.heading("Cantidad", text="Cantidad")
        
        self.tabla.column("Palabra", width=400)
        self.tabla.column("Cantidad", width=100, anchor="center")
        
        self.tabla.pack(fill=tk.BOTH, expand=True)
        
        # Estadísticas
        marco_stats = tk.Frame(self.ventana, bg="#E0E7FF", relief=tk.RAISED, bd=1)
        marco_stats.pack(fill=tk.X, padx=15, pady=10)
        
        self.etiqueta_total = tk.Label(
            marco_stats,
            text="Total de regionalismos: 0 | Palabras únicas encontradas: 0 | Palabra más frecuente: -",
            bg="#E0E7FF", fg=self.color_primario,
            font=("Arial", 10, "bold")
        )
        self.etiqueta_total.pack(pady=10)
    
    def _subir_archivo(self):
        ruta = filedialog.askopenfilename(
            title="Selecciona un archivo de texto",
            filetypes=[("Archivos de texto", "*.txt"), ("Todos", "*.*")]
        )
        if not ruta:
            return
        
        try:
            with open(ruta, "r", encoding="utf-8") as f:
                contenido = f.read()
            self._procesar_analisis(contenido)
        except Exception as e:
            messagebox.showerror("Error", f"No se pudo leer el archivo:\n{e}")
    
    def _procesar_analisis(self, texto):
        texto_lower = texto.lower()
        self.resultados_actuales = {
            pal.lower(): texto_lower.count(pal.lower()) 
            for pal in REGIONALISMOS
        }
        self.total_actual = sum(self.resultados_actuales.values())
        
        self._actualizar_tabla()
        self._actualizar_estadisticas()
    
    def _actualizar_tabla(self, filtro=""):
        for item in self.tabla.get_children():
            self.tabla.delete(item)
        
        filtro = filtro.lower()
        items_mostrados = 0
        
        # Ordenar por cantidad descendente
        items_ordenados = sorted(
            self.resultados_actuales.items(),
            key=lambda x: x[1],
            reverse=True
        )
        
        for palabra, cantidad in items_ordenados:
            if filtro and filtro not in palabra:
                continue
            
            if cantidad > 0:
                self.tabla.insert("", "end", values=(palabra, cantidad))
                items_mostrados += 1
        
        if items_mostrados == 0 and self.total_actual > 0:
            self.tabla.insert("", "end", values=("No hay coincidencias", "-", "-"))
    
    def _actualizar_filtro(self):
        filtro = self.entrada_filtro.get()
        self._actualizar_tabla(filtro)
    
    def _actualizar_estadisticas(self):
        if self.total_actual == 0:
            self.etiqueta_total.config(
                text="Total de regionalismos: 0 | Palabras únicas encontradas: 0 | Palabra más frecuente: -"
            )
            messagebox.showinfo("Resultado", "No se encontraron regionalismos en el texto.")
            return
        
        palabras_unicas = sum(1 for v in self.resultados_actuales.values() if v > 0)
        palabra_frecuente = max(self.resultados_actuales.items(), key=lambda x: x[1])
        
        self.etiqueta_total.config(
            text=f"Total de regionalismos: {self.total_actual} | "
                 f"Palabras únicas encontradas: {palabras_unicas} | "
                 f"Palabra más frecuente: '{palabra_frecuente[0]}' ({palabra_frecuente[1]} veces)"
        )
    
    def _limpiar(self):
        for item in self.tabla.get_children():
            self.tabla.delete(item)
        
        self.entrada_filtro.delete(0, tk.END)
        self.resultados_actuales = {}
        self.total_actual = 0
        self.etiqueta_total.config(
            text="Total de regionalismos: 0 | Palabras únicas encontradas: 0 | Palabra más frecuente: -"
        )

# ==================== Ejecutar la aplicación ====================

if __name__ == "__main__":
    ventana = tk.Tk()
    app = AnalizadorApp(ventana)
    ventana.mainloop()
