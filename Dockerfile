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

RUN mkdir -p /app/log/gunicorn \
    && touch /app/log/gunicorn/gunicorn_access.log \
    && touch /app/log/gunicorn/gunicorn_error.log \
    && mkdir -p /app/log/nginx \
    && touch /app/log/nginx/error.log \
    && touch /app/log/nginx/access.log && \
    chmod -R 755 /app/log

RUN python manage.py migrate && python manage.py collectstatic

#CMD ["gunicorn", "--config", "gunicorn_config.py", "app.wsgi:application"]