### Eureka Server 使用
1. 启动类注解 @EnableEurekaServer 表示当前项目有注册中心，提供服务注册的功能：心跳检测，健康检查，负载均衡功能
2. 当前项目既是 Server 端，也是 Client 端，也需要找个注册中心进行注册，所以需要配置一下注册的地址
    - eureka.client.service-url.defaultZone=http://localhost:8761/eureka/
    - 启动时报错是因为 自己向自身注册，但显然服务端还未启动好，所以报错。但是因为心跳机制会在次隔段时间
    注册，最终会注册成功；注册成功的服务/应用会显示在 Instances currently registered with Eureka 列表
    上，名字就是 spring.application.name
3. 因为 当前应用就是个注册中心，不应该出现在Instances currently registered with Eureka 列表上
    - eureka.client.register-with-eureka=false


### 命令行
nohup java-jar eureka-0.0.1-SNAPSHOT.jar &
ps -ef | grep eureka
kill -9 ***

### Eureka 的高可用:生产上多个  Eureka Server 相互注册
1. 启动两个 Eureka Server 
2. 在 Edit Configuration 里复制一份，通过端口来区分 -Dserver.port=8761 -Dserver.port=8762
3. 注释掉 application.properties 中的 server.port 端口
4. 在准备启动EurekaApplication1时，将其注册到EurekaApplication2，修改配置注册中心为eureka.client.service-url.defaultZone=http://localhost:8762/eureka/ 
5. 在准备启动EurekaApplication2时，将其注册到EurekaApplication1，修改配置注册中心为eureka.client.service-url.defaultZone=http://localhost:8761/eureka/ 
6. client向EurekaApplication1和2均注册 eureka.client.service-url.defaultZone=http://localhost:8761/eureka/,http://localhost:8762/eureka/
7. 作用：当Eureka Server1异常关闭，client仍向Eureka Server2注册
8. 如果需要配置三个Eureka Server 相互注册
    - 则启动EurekaApplication1时，将其注册到EurekaApplication2和EurekaApplication3
    - eureka.client.service-url.defaultZone=http://localhost:8762/eureka/, http://localhost:8763/eureka/ 
    - client 需要向三个Eureka Server进行注册eureka.client.service-url.defaultZone=http://localhost:8761/eureka/,http://localhost:8762/eureka/,http://localhost:8763/eureka/







