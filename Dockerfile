FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

WORKDIR /

RUN apt-get update &&\
    apt-get -y install gcc wget nano software-properties-common git tmux

# Installing cloud-sdk
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y

RUN pip install numpy requests pillow scipy tensorflow-gpu==1.14.0

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
