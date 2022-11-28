FROM denoland/deno:alpine as builder
WORKDIR /app
COPY . .
RUN deno compile --allow-all --unstable --output app app.js
FROM frolvlad/alpine-glibc:alpine-3.16
RUN addgroup --gid 1000 myapp \
  && adduser --uid 1000 --disabled-password myapp --ingroup myapp \
  && mkdir /app/ \
  && chown myapp:myapp /app/
RUN apk --no-cache add ca-certificates tzdata
ENV TZ=Asia/Ho_Chi_Minh
COPY --from=builder /app/app /app/app
CMD ["/app/app"]
