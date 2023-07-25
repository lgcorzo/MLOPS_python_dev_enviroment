FROM hadoop-hive-spark-base AS base
FROM continuumio/miniconda3:latest

RUN apt-get -qq update  \
 && DEBIAN_FRONTEND=noninteractive apt-get -qq install --no-install-recommends \
      sudo \
      openjdk-11-jdk \
      curl \
      coreutils \
      libc6-dev \
 && rm -rf /var/lib/apt/lists/*

ARG USERNAME=jupyter
ARG GROUPNAME=jupyter
ARG UID=1001
ARG GID=1001

RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
 && chmod 0440 /etc/sudoers.d/$USERNAME \
 && groupadd -g $GID $GROUPNAME \
 && useradd -m -s /bin/bash -u $UID -g $GID $USERNAME \
 && usermod -aG root $USERNAME

USER $USERNAME

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

WORKDIR /home/$USERNAME
COPY code_develoment_env.yml ./
# The code to run when container is started:
COPY ./entrypoint.sh ./entrypoint.sh
RUN sudo chmod +x ./entrypoint.sh

# See this tutorial for details https://pythonspeed.com/articles/activate-conda-dockerfile/
RUN conda env create -f code_develoment_env.yml
ENTRYPOINT ["./entrypoint.sh"]
