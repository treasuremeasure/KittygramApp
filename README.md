✅ В ходе этого проекта были выполнены следующие задачи:​

- Создан проект Kittygram на GitHub.

- Настроено проксирование в Nginx к бэкенду.

- Описана сборка бэкенда Kittygram в Dockerfile.

- Настроен запуск проекта Kittygram в контейнерах с помощью Docker Compose.

- Настроено автоматическое тестирование.

- Выполнен деплой проекта на удалённый сервер.​

🐱 Kittygram

Kittygram — это веб-приложение, позволяющее пользователям создавать и делиться карточками своих кошек. Каждая карточка содержит информацию о питомце, включая фотографию, имя, возраст и породу. Приложение разработано с использованием Django и React, упаковано в Docker-контейнеры и развёрнуто с помощью Docker Compose.​

🔄 CI/CD

Процесс CI/CD разделён на два уровня:

CI (Continuous Integration): пайплайн main.yml автоматически запускает тесты, собирает Docker-образы для фронтенда, бэкенда и шлюза, и пушит их в Docker Hub.

CD (Continuous Deployment): после успешной сборки docker-compose.production.yml используется на сервере для скачивания и запуска готовых образов.

🚀 Стек технологий

Backend: Django 3.2.3, Django REST Framework 3.12.4, PostgreSQL

Frontend: React, Node.js

Аутентификация: JWT (djangorestframework-simplejwt 4.8.0)

CI/CD: GitHub Actions

Контейнеризация: Docker, Docker Compose

Веб-сервер: Nginx​

📦 Установка и запуск

1. Клонируйте репозиторий:

git clone https://github.com/treasuremeasure/cloud-services-engineer-kittygram-final_mine.git
cd cloud-services-engineer-kittygram-final_mine

2. Создайте файл окружения .env на основе _env.example:

cp _env.example .env

Отредактируйте .env, указав необходимые переменные окружения.​

3. Запустите проект с помощью Docker Compose:

docker-compose -f docker-compose.production.yml up --build

4. Выполните миграции и соберите статику:

docker-compose -f docker-compose.production.yml exec backend python manage.py migrate
docker-compose -f docker-compose.production.yml exec backend python manage.py collectstatic --noinput

🧪 Тестирование

Для запуска тестов выполните:​

docker-compose -f docker-compose.production.yml exec backend pytest

Также настроено автоматическое тестирование с использованием GitHub Actions.​

🌐 Доступ к приложению

После успешного запуска приложение будет доступно по адресу:​

http://localhost:9000

Nginx проксирует запросы к соответствующим сервисам фронтенда и бэкенда.​

📁 Структура проекта
.
├── backend/               # Код бэкенда на Django
├── frontend/              # Код фронтенда на React
├── nginx/                 # Конфигурация Nginx
├── tests/                 # Тесты
├── docker-compose.production.yml  # Docker Compose файл для продакшена
├── .env                   # Переменные окружения
├── _env.example           # Пример файла .env
├── README.md              # Документация проекта
└── ...

🤝 Контакты

Разработчик: orduhaniriza@gmail.com

Если у вас есть предложения или замечания, пожалуйста, создайте issue или отправьте pull request.
