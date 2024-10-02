from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm  import Session
from src.schemas.auth_schemas import VerificationRequest, SignUpRequest, SignInRequest
from src.services.auth_service import send_verification_code, verify_signup
from src.database import get_db
from src.services.auth_service import authenticate_patient
from src.schemas.doctor_schemas import DoctorOut
from src.services.doctor_service import get_doctors
from typing import List, Optional


router = APIRouter()

@router.post("/auth/", status_code=202)
def get_verification_code(request: VerificationRequest):
    verification_code = send_verification_code(request.email)
    return {"detail": "Verification code sent"}

@router.post("/auth/sign-up")
def signup(request: SignUpRequest, db: Session = Depends(get_db)):
    token = verify_signup(db, request, request.emailVerificationCode)
    return {"Auth": token}

@router.get("/doctors/", response_model=List[DoctorOut])
def search_doctors(
    fullname: Optional[str] = Query(None),
    categories: Optional[List[str]] = Query(None),
    min_exp_years: Optional[int] = Query(None),
    max_exp_years: Optional[int] = Query(None),
    offices: Optional[List[str]] = Query(None),
    workdays: Optional[List[str]] = Query(None),
    sort_by: Optional[str] = Query(None),
    asc_order: Optional[bool] = Query(True),
    db: Session = Depends(get_db)
):
    doctors = get_doctors(
        db=db,
        fullname=fullname,
        categories=categories,
        min_exp_years=min_exp_years,
        max_exp_years=max_exp_years,
        offices=offices,
        workdays=workdays,
        sort_by=sort_by,
        asc_order=asc_order
    )
    return doctors

@router.post("/auth/sign-in")
def login_patient(request: SignInRequest, db: Session = Depends(get_db)):
    return authenticate_patient(db, request)