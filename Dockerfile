FROM ubuntu
LABEL maintainer="contact@randallraboy.com"

ARG TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y ansible vim git curl tzdata locales \
	&& rm -rf /var/lib/apt/lists/* \
	&& ln -f -s /usr/share/zoneinfo/$TZ /etc/localtime \
	&& dpkg-reconfigure -f noninteractive tzdata

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
	&& locale-gen

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

