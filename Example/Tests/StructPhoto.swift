//
//  Photo.swift
//  JSONBridge
//
//  Created by muukii on 8/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import DecodeContext
import SwiftyJSON

struct StructPhoto {
    
    let ID: String
    let width: Int
    let height: Int
    let colorString: String
    let user: StructUser
    let image: StructImage
    
    static let decodeContext = DecodeContext<JSON, StructPhoto> { json in
        try StructPhoto(
            ID: Decoder(String.decodeContext, json["id"]).get(),
            width: Decoder(Int.decodeContext, json["width"]).get(),
            height: Decoder(Int.decodeContext, json["height"]).get(),
            colorString: Decoder(String.decodeContext, json["color"]).get(),
            user: Decoder(StructUser.decodeContext, json["user"]).get(),
            image: Decoder(StructPhoto.StructImage.decodeContext, json["urls"]).get())
    }
}

extension StructPhoto {
    struct StructImage {
        let full: String
        let regular: String
        let small: String
        let thumb: String
        
        static let decodeContext = DecodeContext<JSON, StructImage> { json in
            try StructImage(
                full: Decoder(String.decodeContext, json["full"]).get(),
                regular: Decoder(String.decodeContext, json["regular"]).get(),
                small: Decoder(String.decodeContext, json["small"]).get(),
                thumb: Decoder(String.decodeContext, json["thumb"]).get()
            )
        }
    }
}