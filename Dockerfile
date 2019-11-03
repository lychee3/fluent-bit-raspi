FROM schachr/raspbian-stretch:latest as builder

WORKDIR /tmp
RUN apt-get -y update
RUN apt-get -y install git build-essential cmake flex bison
RUN git clone https://github.com/fluent/fluent-bit

WORKDIR /tmp/fluent-bit
RUN git checkout -b work v1.3.2

WORKDIR /tmp/fluent-bit/build
RUN cmake ..
RUN make
RUN make install


FROM schachr/raspbian-stretch:latest

RUN apt-get -y update
RUN apt-get -y install ssl-cert
RUN mkdir -p /conf
COPY ./conf/fluent.conf /conf
COPY --from=builder /usr/local/bin/fluent-bit /usr/local/bin/fluent-bit