FROM bash:4.4

RUN apk update && apk add
RUN apk add --update grep
RUN mkdir script
COPY script/script.sh /script
RUN bash /script/script.sh