# syntax=docker/dockerfile:1
FROM node:16.10.0

RUN npm install -g npm@8.1.3
RUN npm install -g @vue/cli@4.5.15

RUN mkdir -p /myapp/frontend
WORKDIR /myapp/frontend

COPY package.json /myapp/frontend/package.json
COPY package-lock.json /myapp/frontend/package-lock.json
RUN npm install
