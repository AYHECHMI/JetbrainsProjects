//
//  APIEndPoint.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation

public enum HttpMethod : String {
    case get     = "GET"
    case post    = "POST"
    case delete  = "DELETE"
    case put     = "PUT"
    case patch   = "PATCH"
}

public protocol APIEndPointProtocol {
    
    var baseURL: URL? { get }
    var path: String? { get }
    var httpMethod: HttpMethod? { get }
    var task: HTTPTask? { get }
    var headers: HTTPHeaders? { get }
    
}

extension APIEndPointProtocol {
    public var baseURL: URL? { return nil  }
    public var path: String? { return nil  }
    public var httpMethod: HttpMethod? { return nil }
    public var task: HTTPTask? { return nil }
    public var headers: HTTPHeaders? { return nil }
}
