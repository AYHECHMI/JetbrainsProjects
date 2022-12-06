//
//  HTTPTask.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation

public typealias HTTPHeaders = [String:String]

 public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: [APIQueryParam]?,
        bodyEncoding: ParameterEncoding,
        urlParameters: [APIQueryParam]?)
    
    case requestParametersAndHeaders(bodyParameters: [APIQueryParam]?,
        bodyEncoding: ParameterEncoding,
        urlParameters: [APIQueryParam]?,
        additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}
