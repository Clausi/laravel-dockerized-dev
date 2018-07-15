# Laravel dockerized development environment

## Simple Laravel development environment

### Firstrun:
Install dependencies with a temporary composer docker container from "src" folder
```
docker run --rm -v $(pwd):/app composer install
```

Run the composed images
```
docker-compose up -d
```

Copy .env.example to .env

Generate your application key
```
docker-compose exec app php artisan key:generate
```

Install npm dependencies
```
docker-compose exec app npm install
```

You can now open your laravel app by browsing to http://0.0.0.0:8080

You can generate an alias to simplify executing code inside your app container:
```
alias phpd="docker-compose exec app php"
alias npmd="docker-compose exec app npm"
```
(Add this to ~/bash_alias to make it a permanent alias)

Firstrun might take a while, from now on you can "docker-compose up -d" or "docker-compose down" in a few seconds
