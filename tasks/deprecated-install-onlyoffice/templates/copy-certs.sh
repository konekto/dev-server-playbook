#!/usr/bin/env bash

mkdir /var/onlyoffice/data/certs
cp /etc/letsencrypt/live/office.konek.to/fullchain.pem /var/onlyoffice/data/certs/onlyoffice.crt
cp /etc/letsencrypt/live/office.konek.to/privkey.pem /var/onlyoffice/data/certs/onlyoffice.key

mkdir /var/onlyoffice/document-server/data/certs
cp /etc/letsencrypt/live/document.konek.to/fullchain.pem /var/onlyoffice/document-server/data/certs/onlyoffice.crt
cp /etc/letsencrypt/live/document.konek.to/privkey.pem /var/onlyoffice/document-server/data/certs/onlyoffice.key