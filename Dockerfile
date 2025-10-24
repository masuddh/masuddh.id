# Use official Ruby image as base
FROM ruby:3.2-slim AS builder

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /srv/jekyll

# Copy Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install Jekyll and dependencies
RUN gem install bundler && \
    bundle install

# Copy the rest of the application
COPY . .

# Build the Jekyll site
RUN JEKYLL_ENV=production bundle exec jekyll build

# Production stage - serve with nginx
FROM nginx:alpine

# Copy built site from builder stage
COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
