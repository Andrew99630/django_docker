FROM python:3.10.13-alpine
# Задать переменные среды
# Задать рабочий каталог
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Установить зависимости
RUN pip install --upgrade pip

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt && apt install mc

COPY . .

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]