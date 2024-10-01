from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm  import Session
from src.schemas.auth_schemas import VerificationRequest, SignUpRequest, SignInRequest
from src.schemas.doctor_schemas import DoctorSearchQuery
from src.services.auth_service import send_verification_code, verify_signup
from src.services.doctor_service import search_doctors
from src.database import get_db
from src.services.auth_service import authenticate_patient


router = APIRouter()

@router.post("/auth/", status_code=202)
def get_verification_code(request: VerificationRequest):
    verification_code = send_verification_code(request.email)
    return {"detail": "Verification code sent"}

@router.post("/auth/sign-up")
def signup(request: SignUpRequest, db: Session = Depends(get_db)):
    token = verify_signup(db, request, request.emailVerificationCode)
    return {"Auth": token}

@router.get("/doctors/")
def search_doctors_endpoint(query: DoctorSearchQuery, db: Session = Depends(get_db)):
    doctors = search_doctors(db, query)
    return doctors

@router.post("/auth/sign-in")
def login_patient(request: SignInRequest, db: Session = Depends(get_db)):
    return authenticate_patient(db, request)