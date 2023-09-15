FROM python:3.10.13

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Установить зависимости
RUN pip install --upgrade pip

COPY requirements.txt gunicorn_conf.py /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

RUN python manage.py migrate

#CMD ["gunicorn", "--config", "gunicorn_config.py", "app.wsgi:application"]