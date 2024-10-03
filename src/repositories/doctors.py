
from sqlalchemy.orm import Session
from src.models import Doctor, Category, Slot
from typing import List, Optional
from src.schemas.doctor_schemas import DoctorResourceResponse


def search_doctors(
        db: Session,
        fullname: Optional[str] = None,
        categories: Optional[List[str]] = None,
        min_exp_years: Optional[int] = None,
        max_exp_years: Optional[int] = None,
        offices: Optional[List[str]] = None,
        workdays: Optional[List[str]] = None,
        sort_by: Optional[str] = None,
        asc_order: Optional[bool] = True
):
    query = db.query(Doctor).join(Category, Doctor.category_id == Category.id).join(Slot, Doctor.id == Slot.doctor_id)

    if fullname:
        query = query.filter((Doctor.name.ilike(f"%{fullname}%")) | (Doctor.surname.ilike(f" %{fullname}%")))

    if categories:
        query = query.filter(Category.title.in_(categories))

    if min_exp_years:
        query = query.filter(Doctor.experience >= min_exp_years)

    if max_exp_years:
        query = query.filter(Doctor.experience <= max_exp_years)

    # if offices:
    #     query = query.filter(Doctor.office_id.in_(offices))

    if workdays:
        query = query.filter(Slot.date.in_(workdays))

    if sort_by:
        sort_column = getattr(Doctor, sort_by, None)
        if sort_column:
            if asc_order:
                query = query.order_by(sort_column.asc())
            else:
                query = query.order_by(sort_column.desc())

    query = query.distinct(Doctor.id)
    print(query)
    return query.all()


def get_doctor_resources(db: Session):
    query = db.query(Doctor.id, Doctor.name, Doctor.surname)

    resources = list()
    doctors = query.all()

    for (ids, names, surnames) in doctors:
        resources.append({"id": ids, "name": names, "surname": surnames})

    return resources

