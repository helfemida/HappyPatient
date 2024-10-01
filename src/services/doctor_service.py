from src.repositories.doctors import search_doctors as repo_search_doctors

def search_doctors(query_params):
    return repo_search_doctors(query_params)
