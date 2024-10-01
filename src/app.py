from fastapi import FastAPI
from src.routing import patient

app = FastAPI()

app.include_router(patient.router, prefix="/patient", tags=["patient"])

