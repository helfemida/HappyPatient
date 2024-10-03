from sqlalchemy.orm import Session
from starlette import status

from src.repositories.doctors import search_doctors
from src.schemas.doctor_schemas import DoctorOut, DoctorResourceResponse
from typing import List, Optional
from src.repositories.others import get_category_resources, get_office_resources
from src.repositories.doctors import get_doctor_resources
from fastapi.responses import JSONResponse

from src.schemas.other_schemas import CategoryResourceResponse


def get_resources(
        db: Session,
        doctors: bool,
        categories: bool,
        offices: bool):
    doctor_resources = list()
    category_resources = list()
    office_resources = list()

    if doctors:
        doctor_resources = get_doctor_resources(db)
    if categories:
        category_resources = get_category_resources(db)
    if offices:
        office_resources = get_office_resources(db)
    return JSONResponse(status_code=status.HTTP_200_OK,
                        content={
                            "doctors": doctor_resources,
                            "categories": category_resources,
                            "offices": office_resources
                        })
