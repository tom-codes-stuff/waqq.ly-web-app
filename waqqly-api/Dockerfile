FROM node:18-alpine AS build

ARG DB_URL

WORKDIR /app

COPY . .

RUN npm install

ENV DB_URL=${DB_URL}

CMD ["node", "index.js"]

EXPOSE 3001