FROM ruby:2.7.1

RUN apt-get install tzdata -y

ENV BUNDLER_VERSION=2.2.20
ENV RUBYOPT='-W:no-deprecated -W:no-experimental'

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN gem install bundler -v $BUNDLER_VERSION

ADD . /app
WORKDIR /app

RUN mkdir -p tmp && mkdir -p log
RUN bundle check || bundle install

RUN chown -R $USER:$USER .

CMD rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0
