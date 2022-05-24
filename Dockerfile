FROM python:3.9.12-slim-bullseye

ARG dbt_bigquery_ref=dbt-bigquery@v1.0.0

RUN python -m pip install --upgrade pip
RUN python -m pip install dbt-bigquery

COPY profiles.yml /root/.dbt/profiles.yml

WORKDIR /usr/app/dbt/dv_project
VOLUME /usr/app
ENTRYPOINT tail -f /dev/null
