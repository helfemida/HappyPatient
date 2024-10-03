from fastapi import FastAPI
from src.routing import patient
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(
    CORSMiddleware, 
    allow_origins=['*'],
    allow_credentials=True,
    allow_methods=['*'],
    allow_headers=['*'])


app.include_router(patient.router, prefix="/patient", tags=["patient"])

