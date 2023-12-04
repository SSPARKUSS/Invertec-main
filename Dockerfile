
FROM  ubuntu:22.04

WORKDIR /app_invertec

COPY . .

RUN npm install

EXPOSE 8000

CMD [ "npm","start" ]
# Instala las dependencias necesarias de PHP para Laravel (ajusta según tus necesidades)

