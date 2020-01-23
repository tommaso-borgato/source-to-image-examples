
# Creating a basic S2I builder image with a runtime image

## Creating build image
```
docker build -t s2i-tborgato-maven -f ./build-image/Dockerfile .
```

## Creating the runtime image
```
docker build -t s2i-tborgato-runtime -f ./runtime-image/Dockerfile .
```

## Creating the app image
```
s2i build ./test/test-app s2i-tborgato-maven s2i-tborgato-app --runtime-image s2i-tborgato-runtime --runtime-artifact /tmp/app.jar
```