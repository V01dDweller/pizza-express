FROM jelastic/nodejs:14.20.0-forever
RUN umask 2
RUN mkdir /opt/pizza_express
WORKDIR /opt/pizza_express
COPY lib test views server.js package.json ./
RUN npm install package.json express redis request mocha
RUN chown -R nodejs:nodejs /opt/pizza_express
CMD ["forever", "server.js"]