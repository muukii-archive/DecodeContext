//
//  Photo.swift
//  JSONBridge
//
//  Created by muukii on 8/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import JSONBridge

struct Photo {
    
    let ID: String
    let width: Int
    let height: Int
    let colorString: String
    let user: User
    let image: Image
    
    static let decodeContext = DecodeContext<Photo> { json in
        try Photo(
            ID: Decoder(String.decodeContext, json, "id").get(),
            width: Decoder(Int.decodeContext, json, "width").get(),
            height: Decoder(Int.decodeContext, json, "height").get(),
            colorString: Decoder(String.decodeContext, json, "color").get(),
            user: Decoder(User.decodeContext, json, "user").get(),
            image: Decoder(Photo.Image.decodeContext, json, "urls").get())
    }
}

extension Photo {
    struct Image {
        let full: String
        let regular: String
        let small: String
        let thumb: String
        
        static let decodeContext = DecodeContext<Image> { json in
            try Image(
                full: Decoder(String.decodeContext, json, "full").get(),
                regular: Decoder(String.decodeContext, json, "regular").get(),
                small: Decoder(String.decodeContext, json, "small").get(),
                thumb: Decoder(String.decodeContext, json, "thumb").get()
            )
        }
    }
}