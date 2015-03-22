FROM gliderlabs/alpine:3.1

RUN apk add --update curl postgresql
RUN curl -L -o /bin/gosu https://github.com/tianon/gosu/releases/download/1.3/gosu-amd64 \
	&& chmod +x /bin/gosu
RUN apk del curl
RUN rm -rf /var/cache/apk/*

RUN mkdir /data
RUN chown -R postgres /data

ENV LANG en_US.UTF-8
ENV PGDATA /data

EXPOSE 5432
VOLUME /data

COPY entry /

ENTRYPOINT ["/entry"]
CMD ["postgres"]
