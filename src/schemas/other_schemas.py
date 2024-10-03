from pydantic import BaseModel
from typing import List
from datetime import date


class CategoryResourceResponse(BaseModel):
    id: int
    title: str


class OfficeResourcesResponse(BaseModel):
    address: str


