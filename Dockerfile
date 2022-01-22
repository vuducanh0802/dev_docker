FROM python:3.8

ADD main.py .

RUN pip install requests beautifulsoup4 matplotlib

CMD ["python", "main.py"]