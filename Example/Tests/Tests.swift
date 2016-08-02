import UIKit
import XCTest
import DecodeContext
import SwiftyJSON

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStructDecode() {
        
        let jsonDataPath = NSBundle(forClass: self.dynamicType).pathForResource("sample", ofType: "json")!
        let jsonData = NSData(contentsOfFile: jsonDataPath)!
        
        let json = JSON(data: jsonData)
        
        do {
            let photos = try CollectionDecoder(StructPhoto.decodeContext, json.arrayValue).get()
            print(photos)
        } catch {
            XCTAssert(false, "\(error)")
        }
    }
    
    func testPerformanceStructDecode() {
        // This is an example of a performance test case.
        self.measureBlock {
            self.testStructDecode()
            // Put the code you want to measure the time of here.
        }
    }
    
    func testClassDecode() {
        
        let jsonDataPath = NSBundle(forClass: self.dynamicType).pathForResource("sample", ofType: "json")!
        let jsonData = NSData(contentsOfFile: jsonDataPath)!
        
        let json = JSON(data: jsonData)
        
        do {
            let photos = try CollectionDecoder(ClassPhoto.decodeContext, json.arrayValue).get()
            print(photos)
        } catch {
            XCTAssert(false, "\(error)")
        }
    }
    
    func testPerformanceClassDecode() {
        // This is an example of a performance test case.
        self.measureBlock {
            self.testClassDecode()
            // Put the code you want to measure the time of here.
        }
    }
}
