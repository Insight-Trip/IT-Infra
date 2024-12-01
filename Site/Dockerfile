FROM node

WORKDIR /app

RUN git clone https://github.com/Insight-Trip/Insighttrip.git

WORKDIR /app/Insighttrip

RUN npm install

EXPOSE 3333

CMD npm start
