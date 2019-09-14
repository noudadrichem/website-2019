FROM node:10.8

ENV APP_ROOT /src
ENV HOST 0.0.0.0

RUN useradd -d /home/userwebsite -m -s /bin/bash userwebsite
USER userwebsite

EXPOSE 3000

RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
COPY . ${APP_ROOT}

RUN npm install
RUN npm rebuild node-sass
RUN npm run build

CMD ["npm", "start"]
