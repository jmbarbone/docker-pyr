docker build --progress=plain --tag pyr .
# docker run -p 8080:80 -d --name pyr pyr
# docker run -it --name pyr pyr

# testing
# docker exec pyr /bin/sh -c "Rscript --vanilla r-test.R"
# docker exec pyr /bin/sh -c 'Rscript --vanilla -e "message('Hello, world')"'
# docker exec pyr /bin/sh -c "python3 test_call_r.py"

docker tag pyr jmbarbone/pyr
docker push jmbarbone/pyr
