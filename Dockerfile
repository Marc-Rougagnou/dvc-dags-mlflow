FROM python:3.10-slim

WORKDIR /app

# Installer les dépendances directement via pip
RUN pip install --no-cache-dir fastapi uvicorn[standard] scikit-learn joblib

# Copier tout le contenu du dossier courant dans le conteneur
COPY . .

# Commande pour lancer l'API FastAPI
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
