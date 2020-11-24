# Java 开发脚手架 little

最近半个月主要是在搭一个 `Java` 开发脚手架，日常开发过程中，大多数开发都是以不同的增删改查为主，通过采用 `Mybatis plus` ，我们可以减少日常开发工作中编写通用的增删改查，从而将开发重心放到其他复杂业务上。

## little 简述

`little` 开发脚手架，开发过程中，参照了 [mall-tiny](https://github.com/macrozheng/mall-tiny)  和 [springblade](https://gitee.com/smallc/SpringBlade)  这俩个开发脚手架的架构设计，并根据本人业务需要取舍。主要适用于小程序 / H5 应用系统（含后台管理系统）

**代码规范**

- 遵循《阿里巴巴 Java开发手册》
- `API` 接口遵循 `RESTful`

**项目架构**

```
little
├── little-admin -- 管理端
├    ├── common -- 常用工具
├    ├── config -- 配置类 
├    └── modules -- 业务代码
├        ├── power -- 权限模块
├        ├── system -- 系统模块
├        └── user -- 用户模块
├── little-common -- 常用工具封装包
├── little-mbg -- 代码生成
├    ├── modules -- 生成的 entity、mapper
├    └── MyBatisPlusGenerator -- 代码生成器
├── little-mobile -- 移动端
├    ├── common -- 常用工具
├    ├── config -- 配置类
├    └── modules -- 业务代码
├        ├── system -- 系统模块 
├        └── user -- 用户模块 
├── little-security -- 权限控制模块
├── little-system -- 系统监控（待）
└── little-task -- 定时任务（待）
```

**技术栈**

|         技术         | 概述                     |     版本      |
| :------------------: | ------------------------ | :-----------: |
|     Spring Boot      |                          |     2.1.7     |
|     Mybatis Plus     | Mybatis强化增强          |     3.3.2     |
|        Redis         | 缓存服务器               |       5       |
|        MySQL         | 数据库服务器             |      5.7      |
|   Spring Security    | 结合JWT实现鉴权          |     5.1.6     |
| Swagger-Bootstrap-UI | 强化Swagger样式的API文档 |     1.9.6     |
|        Hutool        | 各种可能用到的工具类包   |     4.5.7     |
|        七牛云        | 存储图片/文件            | 7.2.0, 7.2.99 |
|      阿里云短信      | 短信服务                 |     4.1.0     |

 **主要功能**

- 根据数据表，生成CRUD代码
- 参数校验与全局异常处理
- 基于角色的权限管理
- 定时任务系统（待）
- Spring Boot 应用监控（待）

## 小结

**不足之处：**

- 测试
- 

**项目地址：** 

- [开发脚手架：little]()
- [管理系统页面（Vue+Element）：little-web]()