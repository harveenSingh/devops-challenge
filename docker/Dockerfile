FROM nginx
EXPOSE 80
COPY version.html /usr/share/nginx/html/version/version.html
RUN rm /usr/share/nginx/html/nginx.conf
RUN rm /usr/share/nginx/html/index.html
COPY nginx.conf /usr/share/nginx/html/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
