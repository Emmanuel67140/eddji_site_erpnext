from fastapi import FastAPI
from pydantic import BaseModel
import math, os

app = FastAPI(title="EDDJI ETA Predictor")

class ETARequest(BaseModel):
    distance_km: float
    avg_speed_kmh: float = 25.0  # vitesse urbaine par défaut
    traffic_factor: float = 1.0  # >1 = plus lent

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/eta")
def eta(req: ETARequest):
    # Temps (heures) = distance / vitesse, puis ajustement trafic
    hours = (req.distance_km / max(req.avg_speed_kmh, 5.0)) * req.traffic_factor
    minutes = max(1, int(hours * 60))
    return {"eta_minutes": minutes}