FROM python:3.8-slim

# Répertoire de travail dans le conteneur
WORKDIR /app

# Copie du fichier requirements.txt dans le conteneur
COPY requirements.txt .

# Installation des dépendances à l'aide de pip
RUN python -m venv venv \
    && . venv/bin/activate \
    && pip install --no-cache-dir -r requirements.txt

# Copie de l'application dans le conteneur
COPY . .

# Commande par défaut pour lancer les tests unitaires
CMD ["pytest", "-v"]

# Commande pour lancer l'application en local (pour le développement)
# CMD ["python", "app.py"]
