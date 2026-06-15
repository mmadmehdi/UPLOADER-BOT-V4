FROM python:3.10-slim

WORKDIR /app

# نصب ffmpeg و سایر وابستگی‌های سیستم
RUN apt-get update && apt-get install -y ffmpeg jq && rm -rf /var/lib/apt/lists/*

# کپی فایل‌های پروژه
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["gunicorn", "app:app", "&", "python3", "bot.py"]
