const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('🚀 API Optimisée en Multi-stage !'));
app.listen(3000, () => console.log('Serveur prêt sur le port 3000'));