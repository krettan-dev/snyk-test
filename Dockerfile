# Stage 0, "build-stage", based on Node.js, to build and compile the frontend
FROM node:20-alpine as build-stage
RUN apk update
RUN apk del curl
WORKDIR /app
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install
COPY ./ /app/
RUN npm run build
# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:1.25-alpine
RUN apk update
RUN apk del curl
COPY --from=build-stage /app/build/ /usr/share/nginx/html
# Copy the default nginx.conf provided by tiangolo/node-frontend
COPY nginx-config/nginx.conf /etc/nginx/conf.d/default.conf