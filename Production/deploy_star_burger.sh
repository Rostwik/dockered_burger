#!/bin/bash

git pull
docker compose up -d
docker compose exec -it backend python manage.py collectstatic --noinput
docker compose exec -it backend python manage.py migrate
systemctl reload nginx
source .env
curl -H "X-Rollbar-Access-Token: $ROLLBAR_ACCESS_TOKEN" -H "Content-Type: application/json" -X POST 'https://api.rollbar.com/api/1/deploy' -d '{"environment": "development", "revision": "'"$(git rev-parse HEAD)"'", "rollbar_name": "rostwik", "local_username": "rostwik", "status": "succeeded"}'
echo "Деплой успешно завершен"
