from pydantic import BaseModel
from typing import List
from datetime import date


class Category(BaseModel):
    id: int
    title: str


class DoctorOut(BaseModel):
    id: int
    name: str
    surname: str
    experience: int
    category: Category


class DoctorResponse(BaseModel):
    id: int
    name: str
    surname: str
    date_of_birth: str
    office: str
    experience: int
    category: dict


class DoctorResourceResponse(BaseModel):
    id: int
    name: str
    surname: str


class Config:
    orm_mode = True
