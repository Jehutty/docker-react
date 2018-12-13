#Production Build

#Step - 1 Building production level code
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 
# /app/build folder for serving the app

#Step - 2 Serving production level code with nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html