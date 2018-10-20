#!/bin/bash

images=(
    k8s.gcr.io/kube-apiserver:v1.12.1
    k8s.gcr.io/kube-controller-manager:v1.12.1
    k8s.gcr.io/kube-scheduler:v1.12.1
    k8s.gcr.io/kube-proxy:v1.12.1
    k8s.gcr.io/pause:3.1
    k8s.gcr.io/etcd:3.2.24
    k8s.gcr.io/coredns:1.2.2

    gcr.io/kubernetes-helm/tiller:v2.11.0
)

for image in ${images[@]} ; do
    imageName=`echo $image | cut -d/ -f2`
    name=`echo $imageName | cut -d: -f1`
    ver=`echo $imageName | cut -d: -f2`

    mkdir -p ${name}

    echo "FROM ${image}" > $name/Dockerfile
done

