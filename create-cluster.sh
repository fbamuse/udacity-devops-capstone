#!/usr/bin/env bash

eksctl create cluster \
--name bamuse \
--version 1.18 \
--region ap-northeast-1 \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--managed