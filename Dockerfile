FROM docker.io/crystallang/crystal
RUN apt-get update
RUN apt-get install openssl libevent-dev -y
WORKDIR /app
COPY ./shard.yml ./shard.yml
RUN shards install
COPY ./src/ ./src/
COPY ./assets/ ./assets/
EXPOSE 3000
RUN crystal build ./src/instances.cr --release
CMD ["/app/instances"]
