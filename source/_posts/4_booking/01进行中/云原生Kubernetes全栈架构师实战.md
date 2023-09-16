---
doc_type: weread-highlights-reviews
bookId: '3300028184'
author: 杜宽
cover: >-
  https://cdn.weread.qq.com/weread/cover/87/cpPlatform_11t4mDHaSQ79ZmwxgZ2SkS/t7_cpPlatform_11t4mDHaSQ79ZmwxgZ2SkS.jpg
reviewCount: 0
noteCount: 12
title: 《云原生Kubernetes全栈架构师实战》
categories:
  - 4_booking
  - 01进行中
abbrlink: 9a09f49
date: 2023-09-11 00:00:00
---


## 第1篇 安装篇


- 📌 我们可以使用两种方式安装K8s集群：Kubeadm方式和二进制方式。Kubeadm是一个简单易用的安装工具，可用于快速搭建Kubernetes集群，目前是比较方便和推荐的方式 
    - ⏱ 2023-09-10 21:26:21 

- 📌 由于Kubernetes 1.24以上版本将不再直接支持Docker，因此需要将Kubernetes的Runtime改为Containerd。因为安装Docker时会自动安装Containerd，并且后面的课程也要使用到Docker，所以还是在每个节点安装Docker。 
    - ⏱ 2023-09-10 21:30:36 

- 📌 Node节点（也称为工作节点、Worker节点）上主要部署公司的一些业务应用，生产环境中不建议Master节点部署系统组件之外的其他Pod，测试环境可以允许Master节点部署Pod以节省系统资源。Node节点加入集群和Master的区别是没有--control-plane和--certificate-key参数： 
    - ⏱ 2023-09-10 21:33:54 
## 第2篇 基础篇


- 📌 在公司使用Kubernetes以后，其实对于Docker的直接操作并不多，因为大部分命令已被Kubernetes的客户端工具Kubectl封装，我们使用Kubectl即可完成Kubernetes的日常管理和运维工作，并且Kubernetes 1.24以上版本不再直接支持Docker。 
    - ⏱ 2023-09-10 21:38:30 

- 📌 Docker在逻辑上分为如下几个部分：·　Docker Client：Docker客户端，用于执行Docker的相关命令，比如镜像下载。·　Docker Daemon：Docker守护进程，运行在服务器或者其他工作站上。·　Docker Image：Docker镜像，相当于一个模板，可以用来启动容器。·　Docker Container：Docker容器，由镜像启动，容器内运行着相关的应用程序。 
    - ⏱ 2023-09-10 21:39:32 

- 📌 我们需要使用多阶段构建，将构建步骤和生成业务镜像的步骤拆分，之后将二进制包放置在某个可以运行该二进制包的基础镜像中即可。假如我们使用上一节提到的Scratch镜像制作业务应用镜像，此时的多阶段Dockerfile如下：​​​​​​​# cat Dockerfile​​     # 构建过程￼ ​​​​​FROM golang:1.14.4-alpine as builder￼ ​​​​​WORKDIR /opt￼ ​​​​​COPY hw.go /opt￼ ​​​​​RUN go build /opt/hw.go￼ ​​​​​# CMD "./hw"￼ ​​​​​￼ ​​​​​# 生成应用镜像过程￼ ​​​​​FROM scratch￼ ​​​​​COPY --from=builder /opt/hw .​​ 
    - ⏱ 2023-09-10 21:52:33 
## 第4章 Kubernetes的基础概念


- 📌 很多人会有疑问，有Docker了为什么还用Kubernetes？在业务开始进行容器化时，前期需要容器化的项目可能并不多，涉及的容器也并不多，此时基于Docker容器直接部署至宿主机也能实现自己的需求。但是随着项目越来越多，管理的容器也越来越多，此时使用“裸容器”部署的方式管理起来就显得很吃力，并且随着业务量的增加，会明显体会到“裸容器”的不足，比如：·　宿主机宕机造成该宿主机上的容器不可用，且无法自动恢复。·　容器明明在运行，接口就是不通（健康检查做得不到位）。·　应用程序部署、回滚、扩缩容困难。·　成百上千的容器和涉及的端口难以维护。 
    - ⏱ 2023-09-11 08:31:14 

- 📌 在没有用Kubernetes的时候，查看线下测试的日志，需要开发或者测试人员找到对应的机器，再找到对应的容器，才能查看日志。在使用Kubernetes之后，开发和测试人员直接在Kubernetes的Dashboard上找到对应的Namespace，即可定位到业务的容器，然后可以直接通过控制台查看到对应的日志，大大降低了操作时间。把应用部署到Kubernetes之后，代码的发布、回滚以及蓝绿发布、金丝雀发布等都变得简单可控，不仅加快了业务代码的迭代速度，而且全程无须人工干预。生产环境可以使用Jenkins、GitRunner等工具进行发版或回滚等。从开发环境到测试环境，最后到生产环境，完全遵守一次构建，多集群、多环境部署，通过不同的启动参数、不同的环境变量、不同的配置文件区分不同的环境。 
    - ⏱ 2023-09-11 08:33:00 

- 📌 在负载均衡方面，之前负载均衡可能是Nginx、LVS、HAProxy、F5等，云上可能是云服务商提供的负载均衡机制。每次添加删除节点时，都需要手动去配置前端负载均衡，手动去匹配后端节点。在使用Kubernetes进行编排服务时，使用Kubernetes内部的Service即可实现自动管理节点，并且支持自动扩容、缩容。 
    - ⏱ 2023-09-11 08:33:40 

- 📌 首先Kubernetes本身的学习就很困难，因为Kubernetes概念太多，涉及的知识面也非常广泛，可能学习了一个月也无法入门，甚至连集群也搭建不出来，使人望而却步 
    - ⏱ 2023-09-11 08:34:09 

- 📌 Kubernetes之所以被叫作K8s，业界有两种说法，通俗的说法是k和s之间有8个字母；另一种说法是K8s集群至少需要搭建8遍才能搭建成功。 
    - ⏱ 2023-09-11 08:34:22 

- 📌 ，Kubernetes架构可简单分为主（Master）节点、从（工作/Worker/Node）节点和数据库Etcd。其中主节点为集群的控制单元，一般不会运行业务应用程序，主要包含的组件有Kube-APIServer、Kube-ControllerManager、Kube-Scheduler。从节点为工作节点，也就是部署应用程序容器的节点，主要包含的组件有Kubelet、Kube-Proxy，当然如果Master节点也要部署容器，也会包含这两个组件。 
    - ⏱ 2023-09-11 08:35:05 

# 读书笔记


# 本书评论
