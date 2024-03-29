---
doc_type: weread-highlights-reviews
bookId: CB_FVJ3FZ3DYG5d6lZ6ki8gsFjf
author: 七牛容器云团队
cover: https://res.weread.qq.com/wrepub/CB_7evDWHDX66Nw6ia6gZ9oPCvS_parsecover
reviewCount: 0
noteCount: 6
readingStatus: 未标记
progress: undefined%
totalReadDay: 8
readingTime: 0小时0分钟
readingDate: 2024-01-09
isbn: 
title: 《Kubernetes_in_Action中文版_博文视点图书_七牛容器_Z_Library-1》
date: 2024-01-11

---

![ Kubernetes_in_Action中文版_博文视点图书_七牛容器_Z_Library-1|200](https://res.weread.qq.com/wrepub/CB_7evDWHDX66Nw6ia6gZ9oPCvS_parsecover)


### 1.1 Kubernetes系统的需求


- 📌 因为每个微服务都是独⽴的进程，提供相对静态的API，所以独⽴开发和部署单个微服务成了可能。只要API不变或者向前兼容，改动⼀个微服务，并不会要求对其他微服务进⾏改动或者重新部署。 
    - ⏱ 2024-01-09 19:42:47 
### 1.2 介绍容器技术


- 📌 ⼀个容器⾥运⾏的进程实际上运⾏在宿主机的操作系统上，就像所有其他进程⼀样（不像虚拟机，进程是运⾏在不同的操作系统上的）。但在容器⾥的进程仍然是和其他进程隔离的。对于容器内进程本⾝⽽⾔，就好像是在机器和操作系统上运⾏的唯⼀⼀个进程。 
    - ⏱ 2024-01-11 22:34:40 

- 📌 虚拟机的主要好处是它们提供完全隔离的环境，因为每个虚拟机运⾏在它⾃⼰的Linux内核上，⽽容器都是调⽤同⼀个内核，这⾃然会有安全隐患。如果你的硬件资源有限，那当你有少量进程需要隔离的时候，虚拟机就可以成为⼀个选项。为了在同⼀台机器上运⾏⼤量被隔离的进程，容器因它的低消耗⽽成为⼀个更好的选择。记住，每个虚拟机运⾏它⾃⼰的⼀组系统服务，⽽容器则不会，因为它们都运⾏在同⼀个操作系统上。那也就意味着运⾏⼀个容器不⽤像虚拟机那样要开机，它的进程可以很快被启动。 
    - ⏱ 2024-01-09 19:44:50 

- 📌 那容器到底是怎样隔离它们的。有两个机制可⽤：第⼀个是Linux命名空间，它使每个进程只看到它⾃⼰的系统视图（⽂件、进程、⽹络接⼜、主机名等）；第⼆个是Linux控制组（cgroups），它限制了进程能使⽤的资源量（CPU、内存、⽹络带宽等）。 
    - ⏱ 2024-01-11 22:36:12 
#### 1.2.2 Docker容器平台介绍


- 📌 cgroups是⼀个Linux内核功能，它被⽤来限制⼀个进程或者⼀组进程的资源使⽤。⼀个进程的资源（CPU、内存、⽹络带宽等）使⽤量不能超出被分配的量。这种⽅式下，进程不能过分使⽤为其他进程保留的资源，这和进程运⾏在不同的机器上是类似的 
    - ⏱ 2024-01-11 22:37:14 

- 📌 理论上，⼀个容器镜像能运⾏在任何⼀个运⾏Docker的机器上。
但有⼀个⼩警告——⼀个关于运⾏在⼀台机器上的所有容器共享主机 Linux内核的警告。如果⼀个容器化的应⽤需要⼀个特定的内核版本，那它可能不能在每台机器上都⼯作。如果⼀台机器上运⾏了⼀个不匹配的Linux内核版本，或者没有相同内核模块可⽤，那么此应⽤就不能在其上运⾏。 
    - ⏱ 2024-01-11 22:39:32 

# 读书笔记


# 本书评论
