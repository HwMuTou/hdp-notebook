# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/datascience-notebook:2bfbb7d17524

LABEL maintainer="ICM Project"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root

# 使用自定义的阿里源地址
COPY ./sources.list /etc/apt/sources.list

# 加入HDP2.5.3 命令行安装地址
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
RUN wget http://public-repo-1.hortonworks.com/HDP/ubuntu16/2.x/updates/2.6.5.0/hdp.list -O /etc/apt/sources.list.d/hdp.list

RUN apt-get update

# 安装hadoop
RUN apt-get install hadoop hadoop-hdfs libhdfs0 hadoop-yarn hadoop-mapreduce hadoop-client openssl

RUN apt-get install libsnappy1 libsnappy-dev liblzo2-2 liblzo2-dev hadooplzo

USER $NB_UID
