#build stage
FROM node:12-stretch AS build

WORKDIR /CRA-app

COPY package-lock.json package.json ./
RUN npm ci

COPY . .
RUN npm run build

#run stage
FROM nginx:1.17
WORKDIR /usr/share/nginx/html
COPY --from=build /CRA-app/build .


