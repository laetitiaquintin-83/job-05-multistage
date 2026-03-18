# 🚀 Job 05 : Docker Multi-stage Build

## 🎯 Objectif

L'objectif de cet exercice est de comprendre et mettre en œuvre le **Multi-stage build**. Cette technique permet d'optimiser la taille des images Docker en séparant l'étape de construction (build) de l'étape d'exécution (production).

## 🛠️ Fonctionnement du Dockerfile

Le projet utilise deux étapes distinctes dans le même Dockerfile :

1. **Étape 1 (Builder)** : Utilise une image `node:20` complète pour installer toutes les dépendances nécessaires.
2. **Étape 2 (Production)** : Utilise une image `node:20-slim` (ultra-légère). On utilise la commande `COPY --from=builder` pour ne récupérer que les fichiers nécessaires au fonctionnement de l'API, laissant ainsi de côté les outils de build lourds et inutiles.

## 📊 Comparaison et Optimisation

Grâce au Multi-stage build, l'image finale est considérablement plus légère que les images classiques (comme celles des exercices précédents), ce qui facilite le déploiement et améliore la sécurité.

## 🚀 Lancement du conteneur

Le conteneur est lancé en arrière-plan et map le port 3000 de la machine hôte vers le port 3000 du conteneur.

**Preuve du lancement dans le terminal :**
![Docker Run](./images/02-docker-run.png)

## 🌍 Résultat final

L'API est fonctionnelle et répond correctement sur le navigateur à l'adresse `http://localhost:3000`.

**Capture d'écran du navigateur :**
![Application Browser](./images/03-app-browser.png)

## 🏗️ Commandes utilisées

- Construction : `docker build -t api-multistage .`
- Exécution : `docker run -d -p 3000:3000 --name test-api api-multistage`
