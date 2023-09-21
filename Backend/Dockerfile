FROM python:3.8-slim-buster

WORKDIR /Backend

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000