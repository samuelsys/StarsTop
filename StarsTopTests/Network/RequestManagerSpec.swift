//
//  ApiTests.swift
//  StarsTopTests
//
//  Created by Samuel Furtado on 11/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Quick
import Nimble

@testable import StarsTop

class RequestManagerSpec: QuickSpec {
    
    override func spec() {
        describe("RequestManager") {
            context("After initialized with environment, apiRequest and MockRequest") {
                
                let environment = Environment()
                let apiRequest = AlamofireApiRequest(environment: environment)
                let mockRequest = MockRequest(environment: environment)
                let requestManager = RequestManager(environment: environment, apiRequest: apiRequest, mockRequest: mockRequest)
                
                let requestModel = RequestModel(decoder: Repository.self,
                                                       urlPath: "",
                                                       mockPath: "repositories-page",
                                                       method: .get,
                                                       page: 1)
                
                it("result request as mock and result be success") {
                    waitUntil(timeout: 5) { done in

                        requestManager.request(model: requestModel) { (result) in
                            expect(result).toNot(beNil())
                            done()
                        }
                    }
                }
            }
        }
    }
}
