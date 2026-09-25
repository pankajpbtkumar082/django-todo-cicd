FROM python:3.11-slim

WORKDIR /data

# 1. Copy the requirements file into the container
COPY requirements.txt .

# 2. Install Django and all dependencies inside the image
RUN pip install --no-cache-dir -r requirements.txt

# 3. Copy the rest of your application code
COPY . .

# 4. Now Django is available to run migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
