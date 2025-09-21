docker run -d --name verdaccio \
  -p 4873:4873 \
  -v verdaccio_storage:/verdaccio/storage \
  -v verdaccio_conf:/verdaccio/conf \
  mycomp-verdaccio



docker run -it --rm --name verdaccio \
  -p 4873:4873 \
  mycomp-verdaccio


npm login --registry=http://localhost:4873/
npm logout --registry=http://localhost:4873/




  npm set "//http://localhost:4873/:_authToken=YzgwMWM1MDYyM2ExZTI1MDIzYzJjNDlmYWZhMDliMzA6OWI0MmNmMjY4YWYzZmIyNDkxN2ZhOTJjN2JjNjkxYWY0MmIxMjA3OGFlOThlNWMwZWRkMzVl"