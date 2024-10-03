from sqlalchemy.orm import Session
from src.repositories.doctors import search_doctors
from src.schemas.doctor_schemas import DoctorOut
from typing import List, Optional

def get_doctors(
    db: Session,
    fullname: Optional[str] = None,
    categories: Optional[List[str]] = None,
    min_exp_years: Optional[int] = None,
    max_exp_years: Optional[int] = None,
    offices: Optional[List[str]] = None,
    workdays: Optional[List[str]] = None,
    sort_by: Optional[str] = None,
    asc_order: Optional[bool] = True
) -> List[DoctorOut]:
    doctors = search_doctors(db, fullname, categories, min_exp_years, max_exp_years, offices, workdays, sort_by, asc_order)
    return doctors


