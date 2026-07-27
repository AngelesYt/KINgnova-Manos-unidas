const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'manos_unidas',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

app.get('/health', (_req, res) => {
  res.json({ status: 'ok', message: 'API de Manos Unidas funcionando' });
});

app.get('/api/users', async (_req, res) => {
  try {
    const [rows] = await pool.query(
      'SELECT id, name, email, role, created_at FROM users ORDER BY id DESC'
    );
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/products', async (_req, res) => {
  try {
    const [rows] = await pool.query(
      'SELECT id, title, description, price, category, user_id, created_at FROM products ORDER BY id DESC'
    );
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/products', async (req, res) => {
  try {
    const { title, description, price, category, user_id } = req.body;

    const [result] = await pool.query(
      'INSERT INTO products (title, description, price, category, user_id) VALUES (?, ?, ?, ?, ?)',
      [title, description, price, category, user_id]
    );

    res.status(201).json({ id: result.insertId, message: 'Producto creado' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/exchanges', async (_req, res) => {
  try {
    const [rows] = await pool.query(
      'SELECT id, product_id, user_id, status, created_at FROM exchanges ORDER BY id DESC'
    );
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.post('/api/messages', async (req, res) => {
  try {
    const { exchange_id, sender_id, message } = req.body;

    const [result] = await pool.query(
      'INSERT INTO messages (exchange_id, sender_id, message) VALUES (?, ?, ?)',
      [exchange_id, sender_id, message]
    );

    res.status(201).json({ id: result.insertId, message: 'Mensaje guardado' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
