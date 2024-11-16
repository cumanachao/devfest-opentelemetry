###########################
# Base Information        #
###########################

FROM ruby:3.2.0-alpine

###########################
# Install software        #
###########################

# Install base packages and other software
RUN apk add --no-cache gcompat nodejs build-base libxml2-dev libxslt-dev sqlite-dev tzdata postgresql-dev

###########################
# Set working directory   #
###########################

# Set working directory this directoy is going to
# be used by default
WORKDIR /app2

###########################
# Configure dependencies  #
###########################

# Set the place where bundle is going to install gems
ENV BUNDLE_PATH /bundle

# Configure bundle to to build nokogiri using system libraries
RUN bundle config --global build.nokogiri --use-system-libraries

###########################
# Run the app             #
###########################

EXPOSE 3001

ENTRYPOINT ["/app2/local-entrypoint.sh"]

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
