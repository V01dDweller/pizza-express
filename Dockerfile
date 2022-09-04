FROM jelastic/nodejs:14.20.0-forever
RUN umask 2
RUN mkdir /opt/pizza_express
WORKDIR /opt/pizza_express
COPY lib test views server.js package.json ./
RUN npm install package.json
CMD ["forever", "server.js"]
