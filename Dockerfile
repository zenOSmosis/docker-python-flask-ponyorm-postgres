FROM python:3.6
MAINTAINER jeremy.harris@zenosmosis.com

WORKDIR /app

RUN pip install Flask pony

RUN groupadd -r app && useradd -r -g app app \
    && chown -R app:app /app

USER app

# Copy directory files to /app
ADD . /app

ENV FLASK_APP=hello.py

CMD ["flask", "run", "--host", "0.0.0.0"]