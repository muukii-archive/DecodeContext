# DecodeContext

[![CI Status](http://img.shields.io/travis/muukii/DecodeContext.svg?style=flat)](https://travis-ci.org/muukii/DecodeContext)
[![Version](https://img.shields.io/cocoapods/v/DecodeContext.svg?style=flat)](http://cocoapods.org/pods/DecodeContext)
[![License](https://img.shields.io/cocoapods/l/DecodeContext.svg?style=flat)](http://cocoapods.org/pods/DecodeContext)
[![Platform](https://img.shields.io/cocoapods/p/DecodeContext.svg?style=flat)](http://cocoapods.org/pods/DecodeContext)

## Example

** Define Context **

```Swift
extension String {
    static let decodeContext = DecodeContext<SwiftyJSON.JSON, String> { json in
        return json.string
    }
}
```

**Decode**

```Swift
let id = try Decoder(String.decodeContext, json["id"]).get()
```

## Requirements

## Installation

DecodeContext is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DecodeContext"
```

## Author

muukii, m@muukii.me

## License

DecodeContext is available under the MIT license. See the LICENSE file for more info.
