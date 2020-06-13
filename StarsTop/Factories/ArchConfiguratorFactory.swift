//
//  ArchConfiguratorFactory.swift
//  StarsTop
//
//  Created by Samuel Furtado on 12/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

enum ArchConfiguratorFactory {
    
    static func configureInitialArchFlow<T>(decoder: T.Type, viewController: UIViewController) where T: ArchConfiguratorProtocol {
                
        let appEnvironment = Environment()
        let apiRequest = AlamofireApiRequest(environment: appEnvironment)
        let mockRequest = MockRequest(environment: appEnvironment)
        
        let requestManager = RequestManager(environment: appEnvironment, apiRequest: apiRequest, mockRequest: mockRequest)
        let model = ArchConfiguratorModel(viewController: viewController, clientRequest: requestManager)
      
        T.configureModule(configuratorModel: model)
    }
}
