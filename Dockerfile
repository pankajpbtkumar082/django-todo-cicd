FROM python:3.11-slim

WORKDIR /data

# 1. Copy all your application code first
COPY . .

# 2. Install Django (and gunicorn if you need a production server) directly
RUN pip install --no-cache-dir django

# 3. Run migrations now that Django is installed
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
