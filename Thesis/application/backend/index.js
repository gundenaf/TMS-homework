const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');  // Добавляем cors middleware

const app = express();
const port = 4000;

const pool = new Pool({
  user: 'your_username',
  host: 'db-service',
  database: 'your_database',
  password: 'your_password',
  port: 5432,
});

// Используем CORS middleware
app.use(cors());

// Обработчик OPTIONS-запросов
app.options('*', cors());

app.get('/', (req, res) => {
  res.send('Hello, this is the root!');
});

app.get('/api/data', async (req, res) => {
  try {
    const { rows } = await pool.query('SELECT * FROM example');
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.listen(port, () => {
  console.log(`Backend is running at http://localhost:${port}`);
});
