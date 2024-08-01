FROM node:alpine
WORKDIR app

ARG SERVICE_NAME
ENV SERVICE_NAME=$SERVICE_NAME

COPY test-api/ ./

RUN npm install

EXPOSE 5000

ENTRYPOINT ["node", "src/app.js"]
