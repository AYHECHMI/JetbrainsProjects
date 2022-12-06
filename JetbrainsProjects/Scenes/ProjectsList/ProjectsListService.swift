//
//  ProjectsListService.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation


protocol ProjectsListServiceProtocol {
    func fetchProjectsList(completion: @escaping (Result<[Project], APIError>) -> Void)
}

struct ProjectsListAPIService: ProjectsListServiceProtocol {
    func fetchProjectsList(completion: @escaping (Result<[Project], APIError>) -> Void) {
        let router = APIRouter<APIProjectsService>()
        router.request(.getProjectsList, completion: completion)
    }
}

struct MockProjectRouter: APIProtocol {
    var jsonFileName: String?
}

struct MockProjectsListAPIService: ProjectsListServiceProtocol {
    var fileName: String
    func fetchProjectsList(completion: @escaping (Result<[Project], APIError>) -> Void) {
        let router = APIRouter<MockProjectRouter>()
        router.request(MockProjectRouter(jsonFileName: fileName), completion: completion)
    }

}
