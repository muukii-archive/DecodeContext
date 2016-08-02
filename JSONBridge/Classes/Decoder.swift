// Decoder.swift
//
// Copyright (c) 2016 muukii
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import SwiftyJSON

public struct Decoder<D: DecodeContextProtocol> {
    
    public let source: JSON
    public let context: D
    
    public init(_ context: D, _ json: JSON, file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        
        self.context = context
        self.source = json
        
        #if DEBUG
            debugInfo = {
                "\nFile: \(file)\nFunction: \(function)\nLine: \(line)\nColumn: \(column)\n\nActualValue: \(json)"
            }
        #else
            debugInfo = { "" }
        #endif
    }
    
    public func get() throws -> D.DecodeType {
        
        if let error = source.error {
            throw error
        }
        
        guard let result = try context.decode(source) else {
            throw Error.Nil
        }
        return result                
    }
    
    private let debugInfo: () -> String
}
