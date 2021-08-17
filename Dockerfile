# Builder phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <--
# Run phase
FROM nginx
# copy from builder phase
# static serve with nginx - see docs
COPY --from=builder /app/build /usr/share/nginx/html
# default cmd for nginx is startup
