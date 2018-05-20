#!/bin/bash

mkdir -p lpass-export
cd lpass-export

for id in `lpass ls | sed -n "s/^.*id:\s*\([0-9]*\).*$/\1/p"`; do

  path=`lpass show ${id} | sed "1q;d" | awk '{$NF=""; print $0}' | awk '{$NF=""; print $0}' | awk '{$1=$1};1'`
  attcount=`lpass show ${id} | grep att- | wc -l`

  until [  ${attcount} -lt 1 ]; do
    att=`lpass show ${id} | grep att- | sed "${attcount}q;d" | tr -d :`
    attid=`echo ${att} | awk '{print $1}'`
    attname=`echo ${att} | awk '{print $2}'`

    if [[ -z  ${attname}  ]]; then
      attname=${path#*/}
    fi
    path=${path//\\//}

    if [[ !  -z  ${attid}  ]]; then
      echo ${id} - ${path} ": " ${attid} "-" ${attname}
    fi

    mkdir -p "${path}"
    out=${path}/${attname}

    if [[ -f ${out} ]]; then
        out=${path}/${attcount}_${attname}
    fi

    lpass show --attach=${attid} ${id} --quiet > "${out}"

    let attcount-=1
  done
done

