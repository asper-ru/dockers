#FROM --platform=linux/amd64 ubuntu:18.04
FROM --platform=linux/amd64 python:3.6.15-slim-buster

#RUN apt-get update && apt-get install -y python3 python3-pip chromium-chromedriver chromium-browser
RUN apt-get update && apt-get install -y python3 python3-pip chromium-driver chromium

RUN pip3 install --upgrade pip

WORKDIR /app

COPY . /app

RUN pip3 install -r requirements.txt

RUN mkdir /cache

EXPOSE 8090

RUN apt-get -y --purge autoremove
RUN apt-get -y autoclean

RUN pip3 cache purge

CMD ["python3", "run_app.py"]
