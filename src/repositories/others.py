from typing import List, Type

from sqlalchemy.orm import Session
from src.models import Office, Category


def get_category_resources(db: Session):
    query = db.query(Category.id, Category.title)

    resources = list()
    categories = query.all()

    for (ids, titles) in categories:
        resources.append({"id": ids, "title": titles})

    return resources


def get_office_resources(db: Session):
    query = db.query(Office.address)

    resources = list()
    offices = query.all()

    for address in offices:
        address = str(address)
        resources.append({"address": address})

    return resources
