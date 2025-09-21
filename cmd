# docker run -d --name verdaccio \
#   -p 4873:4873 \
#   -v verdaccio_storage:/verdaccio/storage \
#   -v verdaccio_conf:/verdaccio/conf \
#   mycomp-verdaccio

docker build -t mycomp-verdaccio .

docker run -it --rm --name verdaccio \
  -p 4873:4873 \
  mycomp-verdaccio


npm login --registry=http://localhost:4873/
npm logout --registry=http://localhost:4873/


echo -n "admin:adminSecurePassword1234" | base64

npm config set //localhost:4873/:_auth YWRtaW46YWRtaW5TZWN1cmVQYXNzd29yZDEyMzQ=