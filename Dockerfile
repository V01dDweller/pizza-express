FROM node:14.20.0-alpine3.16
RUN umask 2
RUN mkdir /opt/pizza_express
WORKDIR /opt/pizza_express
ADD lib ./lib
ADD test ./test
ADD views ./views
COPY server.js package.json ./
RUN npm install package.json express redis request mocha
RUN chown -R nodejs:nodejs /opt/pizza_express
USER nodejs
CMD ["forever", "server.js"]