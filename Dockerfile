FROM python:3.10-slim

WORKDIR /app

# نصب ffmpeg (برای تام‌نیل) و سایر نیازمندی‌ها
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# کپی فایل requirements و نصب پکیج‌های پایتون
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# کپی بقیه فایل‌های پروژه
COPY . .

# اجرای ربات (بدون gunicorn)
CMD ["python3", "bot.py"]
