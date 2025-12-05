FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

# Clean cache and install with retry
RUN npm cache clean --force \
 && (npm install --legacy-peer-deps --registry=https://registry.npmjs.org/ || \
     npm install --legacy-peer-deps --registry=https://registry.npmjs.org/)

COPY . .

EXPOSE 8000

CMD ["node", "app.js"]
