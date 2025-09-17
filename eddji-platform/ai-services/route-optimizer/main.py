from fastapi import FastAPI
from pydantic import BaseModel
from typing import List
import os

app = FastAPI(title="EDDJI Route Optimizer")

class Stop(BaseModel):
    id: str
    lat: float
    lon: float
    demand: int = 0

class Vehicle(BaseModel):
    id: str
    capacity: int = 100

class OptimizeRequest(BaseModel):
    depot_lat: float
    depot_lon: float
    stops: List[Stop]
    vehicles: List[Vehicle]

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/optimize")
def optimize(req: OptimizeRequest):
    # Baseline heuristique (Nearest Neighbor par véhicule) — à remplacer par OR-Tools côté prod
    # On évite les dépendances lourdes ici; la structure de retour est stable pour intégration.
    remaining = req.stops[:]
    routes = []
    for v in req.vehicles:
        route = []
        cap = v.capacity
        lat, lon = req.depot_lat, req.depot_lon
        while remaining and cap >= 0:
            # choix naïf: stop le plus proche (distance euclidienne approx)
            best_idx, best_d, best_s = None, 1e18, None
            for i, s in enumerate(remaining):
                d = (s.lat-lat)**2 + (s.lon-lon)**2
                if d < best_d and s.demand <= cap:
                    best_d, best_idx, best_s = d, i, s
            if best_idx is None:
                break
            route.append(best_s.id)
            cap -= best_s.demand
            lat, lon = best_s.lat, best_s.lon
            remaining.pop(best_idx)
        routes.append({"vehicle": v.id, "stops": route})
    return {"routes": routes}