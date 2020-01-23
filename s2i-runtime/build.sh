rm -rdf ./test/test-app/target

echo "==============================================="
echo "Creating build image"
echo "==============================================="
docker build -t s2i-tborgato-maven -f ./build-image/Dockerfile .
sleep 5

echo "==============================================="
echo "Creating runtime image"
echo "==============================================="
docker build -t s2i-tborgato-runtime -f ./runtime-image/Dockerfile .
sleep 5

echo "==============================================="
echo "Creating app image"
echo "==============================================="
s2i build ./test/test-app s2i-tborgato-maven s2i-tborgato-app --runtime-image s2i-tborgato-runtime --runtime-artifact /tmp/app.jar
sleep 5

docker run --rm --network=host s2i-tborgato-app