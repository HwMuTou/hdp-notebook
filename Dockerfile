# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/datascience-notebook:latest

LABEL maintainer="ICM Project"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root

# 使用自定义的阿里源地址
COPY ./sources.list /etc/apt/sources.list
COPY ./hdp.list /etc/apt/sources.list.d/hdp.list

# 加入HDP2.5.3 命令行安装地址
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD

# 默认python命令使用Python2.7
RUN export PATH=/usr/sbin:/usr/bin:/sbin:/bin:$PATH

RUN apt-get update

RUN apt-get install -y zookeeper

# 安装hadoop
RUN apt-get install -y hadoop hadoop-hdfs libhdfs0 hadoop-yarn hadoop-mapreduce hadoop-client openssl

RUN apt-get install -y libsnappy1 libsnappy-dev liblzo2-2 liblzo2-dev hadooplzo

RUN apt-get install -y spark2 hive

RUN export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

USER $NB_UID
