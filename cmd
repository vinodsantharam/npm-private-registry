docker run -d --name verdaccio \
  -p 4873:4873 \
  -v verdaccio_storage:/verdaccio/storage \
  -v verdaccio_conf:/verdaccio/conf \
  mycomp-verdaccio



docker run -it --rm --name verdaccio \
  -p 4873:4873 \
  mycomp-verdaccio