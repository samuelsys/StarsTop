//
//  AlamofireApiRequestSpec.swift
//  StarsTopTests
//
//  Created by Samuel Furtado on 15/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Quick
import Nimble

@testable import StarsTop

class AlamofireApiRequestSpec: QuickSpec {
    
    override func spec() {
        describe("AlamofireApiRequestSpec") {
            context("After initialized with environment") {
                
                let apiRequest = AlamofireApiRequest(environment: Environment())
                 
                let requestModel = RequestModel(decoder: Repository.self,
                                                       urlPath: "search/repositories?q=language:swift&sort=stars",
                                                       mockPath: nil,
                                                       method: .get,
                                                       page: 1)
                
                it("and fetch, result should be success") {
                    waitUntil(timeout: 55) { done in

                        apiRequest.request(model: requestModel) { (result) in
                            expect(result).toNot(beNil())
                            done()
                        }
                    }
                }
            }
        }
    }
}
