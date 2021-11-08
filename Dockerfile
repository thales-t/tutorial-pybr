# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3-slim-buster

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt
#RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
#CMD ["gunicorn", "--bind", "0.0.0.0:8000", "-k", "uvicorn.workers.UvicornWorker", "api_pedidos.api:app"]
#CMD ["uvicorn", "--reload", "0.0.0.0:8000", "api_pedidos.api:app"]
CMD ["uvicorn", "api_pedidos.api:app", "--reload","--host", "0.0.0.0", "--port", "8000"]