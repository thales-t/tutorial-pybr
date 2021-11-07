FROM python:3.10
ENV PYTHONUNBUFFERED 1
WORkDIR /code
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
#RUN cat requirements.txt|xargs poetry add
COPY . /code

CMD python manage.py runserver 0.0.0.0:8000