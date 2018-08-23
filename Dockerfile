# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/datascience-notebook:2bfbb7d17524

LABEL maintainer="ICM Project"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root

COPY ./sources.list /etc/apt/sources.list
COPY ./hdp.list /etc/apt/sources.list.d/hdp.list

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
RUN apt-get update
RUN apt-get install -y --no-install-recommends hadoop
RUN apt-get install -y --no-install-recommends spark2
RUN apt-get install -y --no-install-recommends hive

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID
