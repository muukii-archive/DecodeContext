//
//  User.swift
//  JSONBridge
//
//  Created by muukii on 8/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import DecodeContext
import SwiftyJSON

struct StructUser {
    
    let ID: String
    let username: String
    let name: String
    let profileImage: StructProfileImage
    
    static let decodeContext = DecodeContext<JSON, StructUser> { json in
        
        try StructUser(
            ID: Decoder(String.decodeContext, json["id"]).get(),
            username: Decoder(String.decodeContext, json["username"]).get(),
            name: Decoder(String.decodeContext, json["name"]).get(),
            profileImage: Decoder(StructProfileImage.decodeContext, json["profile_image"]).get())
    }
}

extension StructUser {
    struct StructProfileImage {
        
        let small: String
        let medium: String
        let large: String
        
        static let decodeContext = DecodeContext<JSON, StructProfileImage> { json in
            try StructProfileImage(
                small: Decoder(String.decodeContext, json["small"]).get(),
                medium: Decoder(String.decodeContext, json["medium"]).get(),
                large: Decoder(String.decodeContext, json["large"]).get()
            )
        }
    }
}
