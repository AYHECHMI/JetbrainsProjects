//
//  ProjectsListConfigurator.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation
import UIKit

final class ProjectsListConfigurator {


    // MARK: - Singleton

    static let shared: ProjectsListConfigurator = ProjectsListConfigurator()


    // MARK: - Configuration

    func configure(viewController: ProjectsListViewController) {

        let service = ProjectsListAPIService()
        let dataSource = ProjectsListDataSource()
        var viewModel  = ProjectsListViewModel(dataSource: dataSource)
        viewController.dataSource = dataSource
        viewModel.service = service
        viewController.viewModel = viewModel
        
    }
}
