# Dockerfile
FROM python:3.12.7-alpine

# Устанавливаем зависимости
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем приложение
COPY . /app

# Открываем порт
EXPOSE 8000

# Команда для запуска приложения
CMD ["uvicorn", "src.app:app", "--host", "0.0.0.0", "--port", "8000"]
