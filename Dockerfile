
FROM centos:7

RUN yum update -y && yum install -y wget git make gcc krb5-devel pgme-devel libassuan-devel &&\
    wget https://golang.org/dl/go1.17.2.linux-amd64.tar.gz &&\
    rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.2.linux-amd64.tar.gz &&\
    export PATH=$PATH:/usr/local/go/bin && \
    git clone https://github.com/openshift/oc.git && cd oc &&\
    go mod vendor && go mod tidy &&\
    make oc && mv oc /usr/local/bin
