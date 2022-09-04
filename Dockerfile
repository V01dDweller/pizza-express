FROM jelastic/nodejs:14.20.0-forever
RUN umask 2
RUN mkdir /opt/pizza_express
WORKDIR /opt/pizza_express
COPY . .
RUN npm install package.json
CMD ["forever", "server.js"]
