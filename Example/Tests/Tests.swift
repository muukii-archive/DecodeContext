import UIKit
import XCTest
import JSONBridge
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
    
    func testDecode() {
        
        let jsonDataPath = NSBundle(forClass: self.dynamicType).pathForResource("sample", ofType: "json")!
        let jsonData = NSData(contentsOfFile: jsonDataPath)!
        
        let json = JSON(data: jsonData)
        
        do {
            let photos = try json.arrayValue.map {
                try Photo.decodeContext.decode($0)
            }
            print(photos)
        } catch {
            XCTAssert(false, "\(error)")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}
