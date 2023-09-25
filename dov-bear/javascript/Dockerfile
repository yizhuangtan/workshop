FROM node:latest

## for building the image
##LABEL name=myapp 

WORKDIR /app 

COPY main.js .
COPY package.json .
COPY package-lock.json .
COPY public public
COPY views views

RUN npm ci

#for running the image
ENV PORT=3000 

EXPOSE ${PORT}

ENTRYPOINT node main.js
