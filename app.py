import joblib
from fastapi import FastAPI

app = FastAPI()

model = joblib.load("rf_model.pkl")

@app.get("/")
def root():
    return {"message": "Modèle RF prêt à servir !"}

@app.post("/predict")
def predict(data: dict):
    features = data.get("features")
    prediction = model.predict([features])
    return {"prediction": prediction[0]}
