FROM node:18-slim as build
WORKDIR /src
COPY package*.json .
RUN npm install
COPY . .
FROM node:18-slim
WORKDIR /src
COPY --from=build /src .
EXPOSE 3000
CMD ["node", "index.js"]
