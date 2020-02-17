# this dockerfile is an example
FROM python:3.6-buster

RUN pip install jinja2-cli[yaml]

COPY src /app

WORKDIR /app
