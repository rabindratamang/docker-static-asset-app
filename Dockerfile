#build stage
FROM node:12-stretch AS build
WORKDIR /app
COPY . .
RUN npm ci && npm run build

#run stage
FROM nginx:1.17
WORKDIR /usr/share/nginx/html
COPY --from=build /app/build .


