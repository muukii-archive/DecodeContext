//
//  ClassUser.swift
//  JSONBridge
//
//  Created by muukii on 8/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import DecodeContext
import SwiftyJSON

final class ClassUser {
    
    let ID: String
    let username: String
    let name: String
    let profileImage: ClassProfileImage
    
    init(ID: String, username: String, name: String, profileImage: ClassProfileImage) {
        self.ID = ID
        self.username = username
        self.name = name
        self.profileImage = profileImage
    }
    
    static let decodeContext = DecodeContext<JSON, ClassUser> { json in
        
        try ClassUser(
            ID: Decoder(String.decodeContext, json["id"]).get(),
            username: Decoder(String.decodeContext, json["username"]).get(),
            name: Decoder(String.decodeContext, json["name"]).get(),
            profileImage: Decoder(ClassProfileImage.decodeContext, json["profile_image"]).get())
    }
}

extension ClassUser {
    final class ClassProfileImage {
        
        let small: String
        let medium: String
        let large: String
        
        init(small: String, medium: String, large: String) {
            self.small = small
            self.medium = medium
            self.large = large
        }
        
        static let decodeContext = DecodeContext<JSON, ClassProfileImage> { json in
            try ClassProfileImage(
                small: Decoder(String.decodeContext, json["small"]).get(),
                medium: Decoder(String.decodeContext, json["medium"]).get(),
                large: Decoder(String.decodeContext, json["large"]).get()
            )
        }
    }
}
