yum install -y docker
systemctl enable docker
systemctl start docker
docker build -t jko/ssr:1.0 .
docker run -d -p 5201:2333 jko/ssr:1.0