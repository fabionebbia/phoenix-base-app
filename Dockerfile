FROM elixir:latest

# Install debian packages
RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools postgresql-client git && \
    apt-get clean

ADD . /app

# Install Phoenix packages
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force hex phx_new 1.5.1

# Install node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

WORKDIR /app

RUN mix deps.get
RUN npm install --prefix ./assets

# Exposing Phoenix port
EXPOSE 4000

# Exposing PostgreSQL port - just for debugging purposes
EXPOSE 5432

CMD ["/app/entrypoint.sh"]