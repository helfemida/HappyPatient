from sqlalchemy.orm import Session
from src.models import Doctor

def search_doctors(db: Session, query_params):
    query = db.query(Doctor)
    
    if query_params.fullname:
        query = query.filter(Doctor.name.contains(query_params.fullname) | Doctor.surname.contains(query_params.fullname))
    
    if query_params.category_ids:
        query = query.filter(Doctor.category_id.in_(query_params.category_ids))
    
    if query_params.min_exp_years:
        query = query.filter(Doctor.exp_in_months >= query_params.min_exp_years * 12)
    
    if query_params.max_exp_years:
        query = query.filter(Doctor.exp_in_months <= query_params.max_exp_years * 12)
    
    if query_params.offices:
        query = query.filter(Doctor.office.in_(query_params.offices))
    
    # Добавить сортировку, фильтры по дням работы и другие параметры

    return query.all()
