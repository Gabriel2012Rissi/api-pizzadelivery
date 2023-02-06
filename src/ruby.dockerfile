FROM ruby:3.2.0-alpine

ENV RAILS_ENV=production
ENV RAILS_DIR=/app

# Install dependencies
RUN apk add --no-cache --update build-base \
                                postgresql-dev \
                                libpq-dev \
                                tzdata \
                                nodejs

# Create and set the working directory
RUN mkdir -p ${RAILS_DIR}
WORKDIR ${RAILS_DIR}

# Copy the Gemfile and install gems
COPY Gemfile* ./
RUN bundle install

COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
