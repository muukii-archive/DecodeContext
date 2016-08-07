// CollectionDecoder.swift
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

public struct CollectionDecoder<S, D: DecodeContextProtocol where S == D.SourceType> {
    
    public let sources:[S]
    public let context: D
    
    public init(_ context: D, _ sources: [S], file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
        
        self.context = context
        self.sources = sources
        #if DEBUG
            debugInfo = {
                "\nFile: \(file)\nFunction: \(function)\nLine: \(line)\nColumn: \(column)"
            }
        #else
            debugInfo = { "" }
        #endif
    }
    
    public func get() throws -> [D.DecodeType] {
        
        return try sources.map { source -> D.DecodeType in
            guard let result = try context.decode(source) else {
                throw Error.Nil
            }
            return result
        }
    }
    
    public func getOptional() throws -> [D.DecodeType?] {
        
        return try sources.map { source -> D.DecodeType? in
            let result = try context.decode(source)
            return result
        }
    }
    
    private let debugInfo: () -> String
}
