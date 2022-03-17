# in case we want to dockerize this application
# run: "docker build - bfd-web:v1 ." (change name:tag as needed)
FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY . .
EXPOSE 80