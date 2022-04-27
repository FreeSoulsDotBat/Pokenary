FROM python:latest
ENV PYTHONUNBUFFERED=1
WORKDIR /pokenary

RUN python -m venv /opt/venv
# Enable venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .