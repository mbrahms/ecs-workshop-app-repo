FROM nginx:1.10
COPY index.html /usr/share/nginx/html/
COPY mysite.template /etc/nginx/conf.d/
# Add a dummy test path to simplify local testing
ENV SERVICE_PATH testpath
ENV LINK_SERVER_NAME "http://ecs-workshop.flux7-guest.com/zachgatesak/ecs-workshop-app-repo/master/"
CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/mysite.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
