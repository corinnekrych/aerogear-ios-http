/*
* JBoss, Home of Professional Open Source.
* Copyright Red Hat, Inc., and individual contributors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


import XCTest
import AeroGearHttp

class AGRequestSerializerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGETWithParameters() {
        var url = NSURL.URLWithString("http://api.icndb.com/jokes/12")
        var serialiser = AGRequestSerializerImpl(url: url, headers: [String: String]())
        var result = serialiser.request(.GET, parameters: ["param1": "value1", "array": ["one", "two", "three", "four"], "numeric": 5])
        let unwrappedResult = result!
        let expectedString = "http://api.icndb.com/jokes/12?array%5B%5D=one&array%5B%5D=two&array%5B%5D=three&array%5B%5D=four&param1=value1&numeric=5"
        XCTAssertTrue(unwrappedResult.URL?.absoluteString == expectedString)
    }
    
    func testMultiPartRequestWithPost() {
        var url = NSURL.URLWithString("http://api.icndb.com/jokes/12")
        var serialiser = AGRequestSerializerImpl(url: url, headers: [String: String]())
        var result: NSURLRequest = serialiser.multiPartRequest(.POST)!

        //XCTAssertTrue(result.description.rangeOfString("multipart/form-data; boundary=BOUNDARY_STRING\";"))
    }
    
}
