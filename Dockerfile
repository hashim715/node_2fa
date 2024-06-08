FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

RUN npm install nodemon

COPY . .

RUN cd /usr/src/app

RUN npx prisma generate 

RUN cd /

EXPOSE 5000

RUN chown -R node /usr/src/app

USER node

CMD ["npm", "start"]