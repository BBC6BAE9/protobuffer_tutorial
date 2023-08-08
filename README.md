# Protobuffer极速入门

> Swift & Python demo for staters

## 环境安装

1、推荐使用homebrew安装

```shell
brew install swift-protobuf
```

2、安装python（服务环境）

```shell
brew install python3
```

3、检查python的安装的情况

```
python --version
```

如果打印python版本号说明python已经安装成功，如果出现`\zsh: command not found: python`

```shell
echo "alias python=/usr/bin/python3" >> ~/.zshrc
```

```shell
source ~/.zshrc
```

## 获取协议文件

1、创建一个contact.proto文件

```protobuf
syntax = "proto3";

message Contact {

  enum ContactType {
    SPEAKER = 0;
    ATTENDANT = 1;
    VOLUNTEER = 2;
  }

  string first_name = 1;
  string last_name = 2;
  string twitter_name = 3;
  string email = 4;
  string github_link = 5;
  ContactType type = 6;
  string imageName = 7;
};

message Speakers {
  repeated Contact contacts = 1;
}
```

2、通过命令行生成Python和Swift对应的文件

```shell
protoc --swift_out=. contact.proto
protoc -I=. --python_out=. ./contact.proto
```

这个时候你会看到`contact_pb2.py` 、`contact.pb.swift`两个文件

## 服务端

1、编写一个简单的Python程序，并且将`contact_pb2.py`文件放到后台程序的根目录

2、安装依赖

```
pip install flask
```

3、启动服务

```shell
python3 RWServer.py
```

你将会在控制台看到` Running on http://127.0.0.1:5000`

4、浏览器输入**http://127.0.0.1:5000/currentUser**

```html
VincentNgo@vincentngo2"vincent@mail.com*github.com/vincentngo0:vincentngo.png
```

## 客户端

1、安装 swift-protobuf

客户端需要使用CocoaPod集成苹果官方提供的[swift-protobuf](https://github.com/apple/swift-protobuf)库

```
 pod 'SwiftProtobuf', '~> 1.0'
```

然后pod install

3、将`contact.pb.swift`拖入工程

2、编写一个网络请求

```Swift
import Foundation

class RWService {
    static let shared = RWService()
    let url = "http://127.0.0.1:5000"
    
    private init() { }
  
    func getCurrentUser(_ completion: @escaping (Contact?) -> ()) {
        let path = "/currentUser"
        let url = URL(string: "\(url)\(path)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                completion(nil)
                return
            }
            if let data = data {
                let contact = try? Contact(serializedData: data)
                completion(contact)
            }
        }
        task.resume()
    }
}

```

3、调用

```Swift
 RWService.shared.getCurrentUser { contact in
   guard let contact = contact else {
   		return
   }
   print(contact.firstName);
   print(contact.lastName);
   print(contact.email);
}
```
