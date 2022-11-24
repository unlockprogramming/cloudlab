FROM python:3.7.12

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./ /code
RUN pip install --editable .

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]
