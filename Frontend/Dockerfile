FROM node:14

WORKDIR /Frontend
COPY bundles-src bundles-src
COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci --dev

COPY . .
EXPOSE 3000