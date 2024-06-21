docker run \
  -d \
  --name jenkins \
  -u root \
  -p 8080:8080 \
  -v $HOME/docker/jenkins:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME":/home \
  jenkinsci/blueocean