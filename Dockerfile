FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl python-pip

RUN curl -Ls https://github.com/spf13/hugo/releases/download/v0.20.7/hugo_0.20.7_Linux-64bit.deb -o /tmp/hugo.deb && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

RUN pip install pygments

WORKDIR /app

EXPOSE 1313

CMD ["hugo", "server", "-w", "--bind", "0.0.0.0"]
