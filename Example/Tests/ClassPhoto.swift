//
//  ClassPhoto.swift
//  JSONBridge
//
//  Created by muukii on 8/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import SwiftyJSON
import DecodeContext

final class ClassPhoto {
    
    let ID: String
    let width: Int
    let height: Int
    let colorString: String
    let user: ClassUser
    let image: ClassImage
    
    init(ID: String, width: Int, height: Int, colorString: String, user: ClassUser, image: ClassImage) {
        
        self.ID = ID
        self.width = width
        self.height = height
        self.colorString = colorString
        self.user = user
        self.image = image
    }
    
    static let decodeContext = DecodeContext<JSON, ClassPhoto> { json in
        try ClassPhoto(
            ID: Decoder(String.decodeContext, json["id"]).get(),
            width: Decoder(Int.decodeContext, json["width"]).get(),
            height: Decoder(Int.decodeContext, json["height"]).get(),
            colorString: Decoder(String.decodeContext, json["color"]).get(),
            user: Decoder(ClassUser.decodeContext, json["user"]).get(),
            image: Decoder(ClassPhoto.ClassImage.decodeContext, json["urls"]).get())
    }
}

extension ClassPhoto {
    final class ClassImage {
        let full: String
        let regular: String
        let small: String
        let thumb: String
        
        init(full: String, regular: String, small: String, thumb: String) {
            self.full = full
            self.regular = regular
            self.small = small
            self.thumb = thumb
        }
        
        static let decodeContext = DecodeContext<JSON, ClassImage> { json in
            try ClassImage(
                full: Decoder(String.decodeContext, json["full"]).get(),
                regular: Decoder(String.decodeContext, json["regular"]).get(),
                small: Decoder(String.decodeContext, json["small"]).get(),
                thumb: Decoder(String.decodeContext, json["thumb"]).get()
            )
        }
    }
}
