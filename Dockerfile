FROM denoland/deno:alpine
RUN apk add --no-cache tzdata
ENV TZ=Asia/Ho_Chi_Minh
WORKDIR /app
COPY . .
CMD [ "deno", "run", "--allow-all", "--unstable", "app.ts" ]
