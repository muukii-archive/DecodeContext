//
//  DecodeContexts.swift
//  JSONBridge
//
//  Created by muukii on 8/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import DecodeContext
import SwiftyJSON

extension Int {
    static let decodeContext = DecodeContext<JSON, Int> { json in
        return json.int
    }
}

extension String {
    static let decodeContext = DecodeContext<JSON, String> { json in
        return json.string
    }
}
