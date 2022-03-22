FROM python:2.7
MAINTAINER horvathi

RUN apt-get update 

COPY requirements.txt /tmp/
RUN pip install --upgrade pip \
	&& pip install --user --no-cache-dir -r /tmp/requirements.txt \
	&& pip install --user hungarian

RUN apt-get install --yes \
		gfortran \
		python-qt4 \
		python-opengl \
		python-qt4-gl


COPY pele.zip /tmp/
RUN unzip /tmp/pele.zip -d /tmp/
WORKDIR /tmp/pele-master
RUN python setup.py build --fcompiler=gfortran \
	&& python setup.py install --user

RUN rm -r /tmp/* \
	&& groupadd pele \
	&& useradd --shell /bin/bash -g pele pele

USER pele
