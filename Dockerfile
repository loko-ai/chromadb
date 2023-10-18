FROM python:3.10-slim-bookworm
RUN apt update --fix-missing && apt install -y --fix-missing build-essential
COPY ./requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt
RUN mkdir /chroma
WORKDIR /chroma
COPY ./ /chroma
EXPOSE 8000
RUN export IS_PERSISTENT=1
CMD uvicorn chromadb.app:app --workers 1 --host 0.0.0.0 --port 8000 --proxy-headers
