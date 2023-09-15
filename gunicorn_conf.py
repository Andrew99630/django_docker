bind = "0.0.0.0:8000"  # Указывает Gunicorn слушать на всех интерфейсах на порту 8000
workers = 4  # Количество воркеров Gunicorn (можно изменить в зависимости от ресурсов хоста)
# timeout = 60  # Время ожидания запроса (в секундах)

# Пути к логам
accesslog = "/app/log/gunicorn/gunicorn_access.log"
errorlog = "/app/log/gunicorn/gunicorn_error.log"
