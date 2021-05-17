#!/bin/bash

# S_REGISTRY="gcr.io/spinnaker-marketplace"
T_REGISTRY="ccr.ccs.tencentyun.com/gm-spinnaker"
# T_REGISTRY="docker.io/spinnakercd"
# NODES="node01.zy.com node02.zy.com"
ImgFileDir=./default/

## 指定替换镜像
function CreateImagesFile(){
    echo  "\033[43;34m =====CreateImagesFile===== \033[0m"

    IMAGES=$( cat tagfile.txt)

    for image in ${IMAGES}
    do
        # for node in ${NODES}
        # do 
        # echo  -e "\033[32m ${node} ---> pull ---> ${image} \033[0m"
        # docker pull ${T_REGISTRY}/${image}
        Service=`echo $image|awk -F':' '{print $1}'`
        mkdir -p $ImgFileDir
        imgfile=$ImgFileDir$Service.yml
        # touch $imgfile

        echo 'artifactId:' ${T_REGISTRY}/${image} > $imgfile
        # echo  -e "\033[32m ${node} ---> tag ---> ${image} \033[0m"
        # ssh ${node} "docker tag ${T_REGISTRY}/${image} ${S_REGISTRY}/${image}"
        # done
    done

    echo 'artifactId: ccr.ccs.tencentyun.com/gm-spinnaker/redis-cluster:v2' > $ImgFileDir/redis.yml

    echo '请执行  cp default/* ~/.hal/$DEPLOYMENT/service-settings/  移动对应文件'
    
}

CreateImagesFile
