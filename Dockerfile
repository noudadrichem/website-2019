FROM node:10.8

ENV APP_ROOT /src
ENV HOST 0.0.0.0

EXPOSE 3000

WORKDIR ${APP_ROOT}
COPY . ${APP_ROOT}

RUN npm install
RUN npm rebuild node-sass
RUN npm run build

CMD ["npm", "start"]
