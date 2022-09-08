FROM node:14.20.0-alpine3.16
RUN apk --no-cache add curl
RUN umask 2
RUN mkdir /opt/pizza_express
WORKDIR /opt/pizza_express
ADD lib ./lib
ADD test ./test
ADD views ./views
COPY server.js package.json ./
RUN npm install package.json express redis request mocha
RUN chown -R node:node /opt/pizza_express
USER node
CMD ["node", "server.js"]
