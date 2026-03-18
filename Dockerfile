# --- ÉTAPE 1 : LE BUILDER (Le chantier) ---
# On utilise une image complète avec tous les outils Node.js
FROM node:20 AS builder
WORKDIR /app

# On copie les fichiers de configuration et on installe les dépendances
COPY package*.json ./
RUN npm install

# On copie tout le reste du code source
COPY . .

# --- ÉTAPE 2 : LA PRODUCTION (La maison finie) ---
# On repart d'une image "slim" (très légère, sans outils inutiles)
FROM node:20-slim
WORKDIR /app

# MAGIE : On ne copie QUE le dossier /app qui vient de l'étape "builder"
COPY --from=builder /app .

# On ouvre le port et on lance l'app
EXPOSE 3000
CMD ["node", "server.js"]