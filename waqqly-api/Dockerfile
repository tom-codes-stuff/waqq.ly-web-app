FROM node:18-alpine AS build

WORKDIR /app

COPY . .

RUN npm install

CMD ["node", "index.js"]

EXPOSE 3001