//
//  EnvironmentSwitch.swift
//  StarsTop
//
//  Created by Samuel Furtado on 12/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Foundation
import UIKit

private struct EnvironmentConstants {
    static let infoPlistSchemeConfiguration = "Configuration"
    static let infoPlistSchemeEndpoint = "Endpoint"
    static let unknownScheme = "unknown"
}

final class Environment {
    
    enum Scheme: String {
        case mock = "mock"
        case develop = "develop"
        case homolog = "homolog"
        case production = "production"
        case unknown = "unknown"
    }
            
    private func getConfiguration(_ conf: String) -> String {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: conf) as? String {
            return configuration
        }
        return EnvironmentConstants.unknownScheme
    }
    
    func getCurrentApiURL() -> String {
        return getConfiguration(EnvironmentConstants.infoPlistSchemeEndpoint)
    }
    
    func getCurrent() -> Scheme {
        let buildScheme = getConfiguration(EnvironmentConstants.infoPlistSchemeConfiguration)
        return Scheme.init(rawValue: buildScheme) ?? Scheme.unknown
    }
}
