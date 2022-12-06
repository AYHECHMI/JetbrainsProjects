//
//  APIProjectsService.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation

public enum APIProjectsService {
  case getProjectsList
}

extension MockAPIProtocol {
  public var jsonFileName : String? { return nil }
}

extension APIProjectsService: APIProtocol {
  
  var urlString: String {
    switch APIConfig.shared.environment {
      case .prod: return APIConfig.shared.scheme.rawValue + APIConfig.shared.prodBaseUrl
      case .dev: return APIConfig.shared.scheme.rawValue + APIConfig.shared.devBaseUrl
    }
  }
  
  public var baseURL: URL? {
    guard let url = URL(string: urlString) else { fatalError("baseURL could not be configured.")}
    return url
  }
  
  public var path: String? {
    switch self {
      case .getProjectsList:
        return "/orgs/jetbrains/repos"
    }
    
  }
  public var httpMethod: HttpMethod? {
    return .get
  }
  
  public var task: HTTPTask? {
    return .request
  }
  
  public var headers: HTTPHeaders? {
    return nil
  }
}
