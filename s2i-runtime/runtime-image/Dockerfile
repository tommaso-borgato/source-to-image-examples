
# s2i-tborgato-runtime
FROM openjdk:11

LABEL maintainer="tborgato@redhat.com"

# Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Prova tommy run runtime" \
      io.k8s.display-name="Prova tommy runtime" \
      io.openshift.expose-services="8080:http" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

COPY ./.s2i/bin/ /usr/libexec/s2i
RUN chmod +x /usr/libexec/s2i/*

CMD ["/usr/libexec/s2i/usage"]
