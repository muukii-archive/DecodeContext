//
//  User.swift
//  JSONBridge
//
//  Created by muukii on 8/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import JSONBridge

struct User {
    
    let ID: String
    let username: String
    let name: String
    let profileImage: ProfileImage
    
    static let decodeContext = DecodeContext<User> { json in
        
        try User(
            ID: Decoder(String.decodeContext, json["id"]).get(),
            username: Decoder(String.decodeContext, json["username"]).get(),
            name: Decoder(String.decodeContext, json["name"]).get(),
            profileImage: Decoder(ProfileImage.decodeContext, json["profile_image"]).get())
    }
}

extension User {
    struct ProfileImage {
        
        let small: String
        let medium: String
        let large: String
        
        static let decodeContext = DecodeContext<ProfileImage> { json in
            try ProfileImage(
                small: Decoder(String.decodeContext, json["small"]).get(),
                medium: Decoder(String.decodeContext, json["medium"]).get(),
                large: Decoder(String.decodeContext, json["large"]).get()
            )
        }
    }
}
