# Используем официальный Node.js образ
FROM node:18-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci

# Копируем исходный код
COPY . .

# Собираем клиентское приложение
RUN npm run build

# Открываем порт
EXPOSE 3000

# Запускаем приложение
CMD ["npm", "start"] 