FROM python:3.8.2-slim

COPY app.py .
COPY assets assets
COPY data data
COPY ldacomplaints.py .
COPY local_plots.py .
COPY precomputing.py .
COPY wordcloud_matplotlib.py .
COPY requirements.txt .

RUN pip install -r requirements.txt && python -m spacy download en_core_web_sm && rm requirements.txt

CMD gunicorn app:server -b 0.0.0.0:8050
