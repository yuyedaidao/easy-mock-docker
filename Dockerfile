#FROM mongo:4.0-xenial
FROM mvertes/alpine-mongo
RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ nodejs=8.14.0-r0
RUN apk add redis
RUN apk add --no-cache bash git openssh
RUN apk add --update npm
#FROM redis
# COPY ./easy-mock easy-mock
# WORKDIR cd easy-mock
RUN node -v
RUN npm -v
RUN git clone https://github.com/easy-mock/easy-mock.git
WORKDIR easy-mock
RUN npm install\
    && npm run build

ENTRYPOINT ["npm", "run", "start"]

EXPOSE 7300