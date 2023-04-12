服务源码
=====================================

包含 Dockerfile 和 NodeJs 实现。

server.js 创建一个 HTTP Server，对于所有请求直接响应服务器时间和进程的环境变量。


## 登录云应用 TCR 仓库

通过 `cloudapp docker` 可获取仓库登录凭证，你也可以直接执行下面命令直接完成登录：

```
eval "$(cloudapp docker)"
```

登录后，通过 `cloudapp docker --url` 可以获得仓库位置。

## 构建 & 推送

```
npm run release
```

release 脚本的实现可查看 `package.json` 文件。