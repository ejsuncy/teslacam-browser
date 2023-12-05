# Dockerfile for building the image

FROM node as builder

WORKDIR /app

COPY app.css \
     external.html \
     helpers.js \
     index.html \
     main.js \
     menu.js \
     package.json \
     server.js \
     services.js \
     ui.js \
     yarn.lock \
     ./

RUN npm install --prod

FROM astefanutti/scratch-node

COPY --from=builder /app /

ENTRYPOINT ["node", "server.js", "/media/TeslaCam"]

EXPOSE 8080
