# 1. projects 和 tasks

一个构建脚本 build.gradle 定义了一个project, 包含了若干个task



# 2. 构建java项目:(利用java插件)

~~~properties
1. 创建脚本: build.gradle
2. 首行加上: apply plugin: 'com.app.application'  //包名
3. gradle会做这些:
	在 src/main/com/app/application中搜寻打包源码
	在 src/test/com/app/application中搜寻测试源码
	在 src/main/resources下的所有文件都会被打包
	在 src/test/resources 下所有文件会被添加到类路径以执行测试
~~~



# 3. java插件:

插件提供了常用的任务:

~~~properties
build: 编译构建项目, 执行测试, 并打包资源文件

clean: 删除build目录及构建完成的文件

assemble: 编译并打包jar文件, 不会执行单元测试,(加上其他插件可以增强这个task)

check: 编译并测试代码(加上其他插件可以增强, 例如风格检查)
~~~



# 4. 外部依赖:

添加Maven仓库:

~~~groovy
# build.gradle
apply plugin: 'com.app.application'

repositories {
    mavenCentral()
}

dependencies {
    compile group: 'commons-collections', name: 'commons-collections', version: '3.2'
    testCompile group: 'junit', name: 'junit', version: '4.+'
}
~~~

# 5. 自定义项目:(暂时没用)

