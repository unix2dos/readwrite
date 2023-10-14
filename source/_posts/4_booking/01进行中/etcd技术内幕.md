---
doc_type: weread-highlights-reviews
bookId: "3300055439"
author: 百里燊
cover: https://cdn.weread.qq.com/weread/cover/5/cpplatform_g1xmnpkbs4j9d4evg6qrmf/t7_cpplatform_g1xmnpkbs4j9d4evg6qrmf1681438996.jpg
reviewCount: 0
noteCount: 7
title: 《etcd技术内幕》
date: 2023-09-18
---


## 前言


- 📌 etcd作为一个优秀的分布式KV存储产品，其底层的etcd-raft模块实现了Raft协议，可以帮助开发者快速实现最终一致性功能 
    - ⏱ 2023-09-18 13:29:28 

- 📌 etcd的代码中有很多亮点，为了提高整体性能，其实现中使用了大量的goroutine和Channel。etcd 3中开始使用BoltDB作为底层的持久存储，使用BTree索引加速查询，还提供了可靠的Watcher功能，同时提供了基于GRPC的新版本客户端。当然，etcd 3依然兼容etcd 2的内存存储和HTTP API。 
    - ⏱ 2023-09-18 13:29:48 
## 第1章 etcd入门


- 📌 · 一致性协议：一致性协议是配置共享和服务发现组件的核心，etcd底层采用了Raft协议，而ZooKeeper使用ZAB协议，ZAB协议是一种类Paxos的一致性协议。目前公认的是Raft比Paxos协议易于理解，工程化也较为容易。· API接口：etcd v2版本中提供了HTTP+JSON的调用方式，在etcd v3版本的客户端中则使用GRPC与服务端进行交互，而GRPC本身就是跨平台的。 
    - ⏱ 2023-09-18 13:31:24 
## 1.2 数据模型


- 📌 这里简单介绍多版本存储的含义，假设键K1对应的值为V1，当我们将K1对应的值修改成V2时，etcd并不会直接将V1修改成V2，而是同时记录V1和V2两个值，并通过不同的版本号进行区分。另外，Watch历史事件的含义是，我们可以向一个Key添加Watcher，同时可以指定一个历史版本，从该版本开始的所有事件都会触发该Watcher。 
    - ⏱ 2023-09-18 13:33:36 

- 📌 每个Key会对应多个generation，当Key首次创建时，会同时创建一个与之关联的generation实例，当该Key被修改时，会将对应的版本记录到generation中，当Key被删除时，会向generation中添加tombstone，并创建新的generation，会向新generation中写入后续的版本信息。 
    - ⏱ 2023-09-18 13:34:54 

- 📌 在查询时，先在内存索引中通过用户指定的Key值，查找到该Key值对应的全部版本号，然后根据用户指定的版本号，从底层存储中查找到具体的Value值。当然，如果指定的版本号已经被etcd压缩删除，则无法再查询到该版本的Value值。在etcd v3版本中，底层存储使用的是BoltDB，其中的Key是版本信息(main revision+sub revision)。这样，在查询时先通过上述B树索引查找到对应的版本信息，然后在BoltDB中通过版本信息查找相应的Value值。 
    - ⏱ 2023-09-18 13:35:19 
## 1.3 环境搭建


- 📌 etcd服务端会监听本地的2379和2380两个端口，其中2379端口用于与客户端的交互，2380端口则是用于etcd节点内部交互（主要是发送Raft协议相关的消息等）。 
    - ⏱ 2023-09-18 13:37:46 

# 读书笔记


# 本书评论
