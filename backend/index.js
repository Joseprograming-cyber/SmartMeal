const express = require('express');
const mysql = require('mysql2');
const bcrypt = require('bcryptjs');
const cors = require('cors');
const path = require('path');

const app = express();
const port = 4000;

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, '../frontend')));

// RUTAS DE PÁGINAS
app.get('/', (req, res) => res.sendFile(path.join(__dirname, '../frontend/views/login.html')));
app.get('/food-entry', (req, res) => res.sendFile(path.join(__dirname, '../frontend/views/index.html')));
app.get('/budget', (req, res) => res.sendFile(path.join(__dirname, '../frontend/views/Budget.html')));
app.get('/weekly-plan', (req, res) => res.sendFile(path.join(__dirname, '../frontend/views/Weeklyplan.html')));

// CONEXIÓN BASE DE DATOS
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'smartmeal_db',
  port: 3307
});
db.connect(err => {
  if (err) console.log('⚠️ Error BD');
  else console.log('✅ Conectado a SmartMeal');
});

// API: Registro
app.post('/api/register', async (req, res) => {
  const { nombre, email, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  db.query('INSERT INTO usuarios (nombre, email, password) VALUES (?, ?, ?)', [nombre, email, hashedPassword], (err) => {
    if (err) res.status(500).json({ error: 'Error al registrar' });
    else res.json({ mensaje: 'Registrado' });
  });
});

// API: Login
app.post('/api/login', (req, res) => {
  const { email, password } = req.body;
  db.query('SELECT * FROM usuarios WHERE email = ?', [email], async (err, results) => {
    if (results.length === 0) return res.status(400).json({ error: 'Usuario no encontrado' });
    const user = results[0];
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(400).json({ error: 'Contraseña incorrecta' });
    res.json({ mensaje: 'Login OK', nombre: user.nombre, usuarioId: user.id });
  });
} );

// Obtener ingredientes del usuario
app.get('/api/ingredientes/:usuarioId', (req, res) => {
  const { usuarioId } = req.params;
  db.query('SELECT id, nombre, categoria, precio FROM ingredientes_usuario WHERE usuario_id = ?', [usuarioId], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

// Agregar ingrediente
app.post('/api/ingredientes', (req, res) => {
  const { usuarioId, categoria, nombre, precio } = req.body;
  if (!usuarioId || !categoria || !nombre || precio === undefined) {
    return res.status(400).json({ error: 'Faltan datos' });
  }
  db.query('INSERT INTO ingredientes_usuario (usuario_id, categoria, nombre, precio) VALUES (?, ?, ?, ?)',
    [usuarioId, categoria, nombre, precio], (err, result) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json({ id: result.insertId, nombre, categoria, precio });
    });
});

// Eliminar ingrediente
app.delete('/api/ingredientes/:id', (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM ingredientes_usuario WHERE id = ?', [id], (err) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ mensaje: 'Eliminado' });
  });
});

// Guardar presupuesto
app.post('/api/presupuesto', (req, res) => {
  const { usuarioId, monto } = req.body;
  if (!usuarioId || !monto) {
    return res.status(400).json({ error: 'Faltan datos' });
  }
  const fecha = new Date().toISOString().slice(0,10);
  db.query('INSERT INTO presupuesto_semanal (usuario_id, monto, fecha) VALUES (?, ?, ?)', 
    [usuarioId, monto, fecha], 
    (err) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json({ mensaje: 'Presupuesto guardado' });
    });
});

// Obtener último presupuesto del usuario
app.get('/api/presupuesto/:usuarioId', (req, res) => {
  const { usuarioId } = req.params;
  db.query('SELECT monto FROM presupuesto_semanal WHERE usuario_id = ? ORDER BY fecha DESC LIMIT 1', 
    [usuarioId], 
    (err, results) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json(results[0] || { monto: 0 });
    });
});

app.listen(port, () => console.log(`🚀 Servidor listo en http://localhost:${port}`));