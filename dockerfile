FROM jenkins/jenkins
WORKDIR /tmp
COPY jenkins/jenkins/*
EXPOSE 8080
CMD [ "npm","start" ]
