
# 🥗 SmartMeal – Planificador semanal de comidas inteligente

**SmartMeal** es una aplicación web full-stack que ayuda a personas y familias a organizar su alimentación semanal de forma automática, ahorrando tiempo, dinero y esfuerzo mental. El usuario registra sus ingredientes con precios reales (por porción), define un presupuesto, y la aplicación genera un menú completo de 7 días (desayuno, almuerzo y cena) combinando los ingredientes disponibles y respetando el presupuesto.

---

## 🎯 ¿Para quién es SmartMeal?

- **Madres y padres** que cocinan a diario y quieren evitar el estrés de decidir "¿qué comemos mañana?".
- **Estudiantes** con poco tiempo y presupuesto ajustado.
- **Personas que desean ahorrar** en alimentación, reduciendo desperdicios y compras impulsivas.
- **Cualquier persona** que quiera una alimentación variada sin complicaciones.

---

## ✨ Características principales

- ✅ **Registro e inicio de sesión** seguro (contraseñas encriptadas con bcrypt).
- ✅ **Gestión de ingredientes** (CRUD: Crear, Leer, Eliminar) organizados en 4 categorías:
  - Proteínas
  - Carbohidratos
  - Verduras
  - Otros (aceites, especias, etc.)
- ✅ **Validación** de mínimo 4 ingredientes por categoría para garantizar variedad.
- ✅ **Asignación de presupuesto semanal** (mínimo configurable, por defecto $10.000 COP).
- ✅ **Generación automática de menú semanal**:
  - 7 días (Lunes a Domingo).
  - Cada día incluye: desayuno, almuerzo y cena.
  - Los ingredientes se combinan aleatoriamente pero respetando su clasificación (desayuno, almuerzo, cena) mediante palabras clave.
  - El costo total del plan se ajusta automáticamente si supera el presupuesto.
- ✅ **Interfaz moderna y responsive** (diseño limpio, adaptable a móviles y tablets).
- ✅ **Persistencia de datos** en MySQL: cada usuario tiene sus propios ingredientes y presupuesto.

---

## 🛠️ Tecnologías utilizadas

| Capa | Tecnologías |
|------|--------------|
| Frontend | HTML5, CSS3 (metodología BEM), JavaScript (ES6+), TailwindCSS (parcial), Google Fonts, Material Symbols |
| Backend | Node.js, Express.js |
| Base de datos | MySQL (con phpMyAdmin para desarrollo) |
| Comunicación | API REST (fetch) |
| Seguridad | Bcrypt (hash de contraseñas), CORS |
| Control de versiones | Git + GitHub |

---

## 📦 Instalación y ejecución local (para desarrolladores)

Sigue estos pasos para tener la aplicación funcionando en tu computadora:

### Requisitos previos
- Node.js (v18 o superior) → [Descargar](https://nodejs.org/)
- MySQL (XAMPP, WAMP o MySQL Community) → [Descargar](https://www.apachefriends.org/)

### Pasos

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/Joseprograming-cyber/SmartMeal.git
   cd SmartMeal











<img width="1286" height="632" alt="Captura de pantalla 2026-04-13 174248" src="https://github.com/user-attachments/assets/88924de1-c59d-40a3-893d-4d41f360caeb" />


## Modelo de Datos

### Diagrama Entidad-Relación
![Diagrama ER](./diagrama_er.png)

### Diccionario de Datos

#### Tabla `usuarios`
| Campo | Tipo | Nulo | Clave | Descripción |
|-------|------|------|-------|-------------|
| id | INT | NO | PK | Identificador único del usuario |
| nombre | VARCHAR(100) | NO | - | Nombre completo del usuario |
| email | VARCHAR(100) | NO | UNIQUE | Correo electrónico (usado para login) |
| password | VARCHAR(255) | NO | - | Contraseña encriptada con bcrypt |
| created_at | TIMESTAMP | SÍ | - | Fecha y hora de registro |

#### Tabla `ingredientes_usuario`
| Campo | Tipo | Nulo | Clave | Descripción |
|-------|------|------|-------|-------------|
| id | INT | NO | PK | Identificador único del ingrediente |
| usuario_id | INT | NO | FK | Referencia al usuario dueño del ingrediente |
| categoria | ENUM('proteínas','carbohidratos','verduras','otros') | NO | - | Categoría del ingrediente |
| nombre | VARCHAR(100) | NO | - | Nombre del ingrediente |
| precio | INT | NO | - | Precio por porción en pesos colombianos |
| tipo_comida | ENUM('desayuno','almuerzo','cena') | NO | - | Tipo de comida al que pertenece |

#### Tabla `presupuesto_semanal`
| Campo | Tipo | Nulo | Clave | Descripción |
|-------|------|------|-------|-------------|
| id | INT | NO | PK | Identificador único del registro |
| usuario_id | INT | NO | FK | Referencia al usuario |
| monto | INT | NO | - | Presupuesto semanal en pesos colombianos |
| fecha | DATE | NO | - | Fecha de creación del presupuesto |

