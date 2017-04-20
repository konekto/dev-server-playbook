# {{ ansible_managed }}
FROM python:2.7

MAINTAINER Radicale project "radicale@librelist.com"

ENV VERSION {{radicale_version}}
#{{ radicale_version }}
ENV TARBALL https://github.com/Kozea/Radicale/archive/${VERSION}.tar.gz

RUN apt-get update -y
RUN apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev

RUN pip install --upgrade pip \
      && pip install passlib bcrypt python-ldap

RUN wget ${TARBALL} \
    && tar xzf ${VERSION}.tar.gz \
    && cd Radicale-${VERSION} && python setup.py install \
    && mkdir -p /etc/radicale

COPY config /etc/radicale/config
COPY logging /etc/radicale/logging
COPY rights /etc/radicale/rights

EXPOSE 5232

CMD ["radicale", "-f", "-C", "/etc/radicale/config"]
