FROM ubuntu:20.04

MAINTAINER Terradue S.r.l
USER root

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    SHELL=/bin/bash \
    PATH=/srv/conda/bin:$PATH \
    DEBIAN_FRONTEND=noninteractive \
    NB_USER=jovyan \
    NB_UID=1002 \
    NB_GID=1002 \
    APP_BASE=/srv
    
ENV USER=${NB_USER} \ 
    HOME=/home/${NB_USER} \
    CONDA_DIR=${APP_BASE}/conda
    
RUN groupadd --gid ${NB_GID} ${NB_USER}                                                                                             && \
    useradd --comment "Default user" --create-home --gid ${NB_GID} --no-log-init --shell /bin/bash --uid ${NB_UID} ${NB_USER}       && \
    apt-get -qq update                                                                                                              && \
    apt-get -qq install --yes apt-utils                                                                                             && \
    apt-get -qq install --yes --no-install-recommends ttf-dejavu wget make g++ sudo vim less unzip tree file  locales > /dev/null   && \
    apt-get -qq purge                                                                                                               && \
    apt-get -qq clean                                                                                                               && \
    rm -rf /var/lib/apt/lists/*                                                                                                     && \
    echo "LC_ALL=en_US.UTF-8" >> /etc/environment                                                                                   && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen                                                                                     && \
    echo "LANG=en_US.UTF-8" > /etc/locale.conf                                                                                      && \
    locale-gen en_US.UTF-8

# conda installation via miniforge
ADD .docker/install-miniforge.bash /tmp/install-miniforge.bash

RUN chmod 755 /tmp/install-miniforge.bash                                                                                           && \
    /tmp/install-miniforge.bash                                                                                                     && \
    rm -f /tmp/install-*.bash                                                                                                       && \
    chown -R $NB_USER:$NB_GID ${HOME} 

USER ${NB_USER}

ENV PATH=${CONDA_DIR}/envs/env_snap/snap/bin:${CONDA_DIR}/envs/env_snap/bin:${CONDA_DIR}/bin:$PATH \
    KERNEL_PYTHON_PREFIX=${CONDA_DIR}/envs/env_snap  \
    PREFIX=${CONDA_DIR}/envs/env_snap

ADD environment.yml /tmp/environment.yml

RUN mamba env create -f /tmp/environment.yml                                                                 && \
    mamba clean --all -f -y

WORKDIR ${HOME}