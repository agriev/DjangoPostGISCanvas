# BASIC Docker Ready 

Creasted and rarely supported by Anton Griev

## Django+GeoDjango+PostGIS+PostgreSQL quickstart project

# Requires

Docker installation

# To setup the project:
## Run
```bash
touch .env 
```
Contents of .env
```env
POSTGRES_PASSWORD=secret
POSTGRES_USER=postgres
DJANGO_SECRET_KEY=sadklfhbasdkfbasfbaspsdfsdfsdfgsfagsdfgd
```

## Then run
```bash
docker-compose up --build
```
## After build you can use to run

```bash
docker-compose up
```
## To clean use
```bash
docker-compose down
```
## To create migrations:
```bash
docker-compose exec djangoapi python manage.py makemigrations
docker-compose exec djangoapi python manage.py migrate
```
## To create admin user:
```bash
docker-compose exec djangoapi python manage.py createsuperuser
```


## Materials used during compilations
[Nice about Docker and Django](https://medium.com/faun/tech-edition-how-to-dockerize-a-django-web-app-elegantly-924c0b83575d)