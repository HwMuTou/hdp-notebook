# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/datascience-notebook:latest

LABEL maintainer="ICM HDP With Datascience-notebook Project"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root

# 使用自定义的阿里源地址, 引入HDP软件源
COPY ./sources.list /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y gnupg && \
    apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
COPY ./hdp.list /etc/apt/sources.list.d/hdp.list

# 安装zookeeper hadoop spark hive
RUN apt-get update && \
    export PATH=/usr/sbin:/usr/bin:/sbin:/bin:$PATH && \
    apt-get install -y zookeeper \
    hadoop hadoop-hdfs libhdfs0 hadoop-yarn hadoop-mapreduce hadoop-client openssl \
    tez spark2 hive

RUN echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/" >> /etc/profile

USER $NB_UID
