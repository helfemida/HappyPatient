from pydantic import BaseModel
from typing import List
from datetime import date

class DoctorSearchQuery(BaseModel):
    fullname: str | None
    category_ids: List[int] | None
    min_exp_years: int | None
    max_exp_years: int | None
    offices: List[str] | None
    workdays: List[str] | None
    sort_by: str | None
    asc_order: bool | None

class DoctorResponse(BaseModel):
    id: int
    name: str
    surname: str
    date_of_birth: str
    office: str
    expInMonths: int
    category: dict
