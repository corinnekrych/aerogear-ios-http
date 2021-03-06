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

import Foundation

protocol AGRequestSerializer {
    var url: NSURL {get set}
    var headers: Dictionary<String, String> {get set}
    var stringEncoding: NSNumber {get}
    var cachePolicy: NSURLRequestCachePolicy {get}
    var timeoutInterval: NSTimeInterval {get set}
    var boundary: String {get}
    
    func request(method: AGHttpMethod, parameters: [String: AnyObject]?) -> NSURLRequest?
    func multiPartRequest(method: AGHttpMethod) -> NSURLRequest?
}