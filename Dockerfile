# Python support can be specified down to the minor or micro version
# (e.g. 3.6 or 3.6.3).
# OS Support also exists for jessie & stretch (slim and full).
# See https://hub.docker.com/r/library/python/ for all supported Python
# tags from Docker Hub.
FROM python:3

# If you prefer miniconda:
#FROM continuumio/miniconda3

LABEL Name=djangoapi Version=0.0.1
EXPOSE 3000
ENV PYTHONUNBUFFERED 1
RUN apt-get update && \
    apt-get -y install postgresql-client-11  && \
    apt-get -y install binutils libproj-dev gdal-bin

WORKDIR /app
ADD . /app
COPY requirements.txt /app/

# Using pip:
RUN python3 -m pip install -r requirements.txt
COPY . /app/

## THE LIFE SAVER
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait

## Launch the wait tool and then your application
CMD /wait 
#CMD ["python3", "-m", "djangoapi"]

# Using pipenv:
#RUN python3 -m pip install pipenv
#RUN pipenv install --ignore-pipfile
#CMD ["pipenv", "run", "python3", "-m", "djangoapi"]

# Using miniconda (make sure to replace 'myenv' w/ your environment name):
#RUN conda env create -f environment.yml
#CMD /bin/bash -c "source activate myenv && python3 -m djangoapi"
