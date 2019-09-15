FROM node:10.8

ENV APP_ROOT /home/appuser
ENV HOST 0.0.0.0

EXPOSE 3000

RUN useradd --create-home --shell /bin/bash appuser

WORKDIR ${APP_ROOT}
COPY . ${APP_ROOT}

RUN npm install
RUN npm rebuild node-sass
RUN npm run build

USER appuser

CMD ["npm", "start"]
