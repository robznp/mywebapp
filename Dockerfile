FROM nginx:alpine

# Install gettext for envsubst
RUN apk add --no-cache gettext

# Set environment variable for the header text
# ENV HEADER_TEXT="Welcome to My Static Page!"

# Copy the HTML and CSS files into the container
COPY index.html /usr/share/nginx/html/index.html
COPY styles.css /usr/share/nginx/html/styles.css
COPY image.jpg /usr/share/nginx/html/image.jpg


# Use envsubst to replace the environment variable in index.html and then move the updated file
CMD envsubst '${HEADER_TEXT}' < /usr/share/nginx/html/index.html > /tmp/index.html && mv /tmp/index.html /usr/share/nginx/html/index.html && nginx -g 'daemon off;'
