//
//  ProjectsListWorker.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation

class ProjectsListWorker {
  
    func generateSectionsViewModel(Projects: [Project]) -> [TableSectionViewModel] {
        
        let rows = Projects.map { (Project) -> ProjectRowViewModel in
            //full_name, forks, open_issues, watchers
            return ProjectRowViewModel(full_name: Project.fullName, description: Project.projetDescription ?? "", forks: Project.forks, open_issues: Project.openIssues, watchers: Project.watchers)
        }
        let sections = rows.count > 0 ? [ProjectsSectionViewModel(dataModel: rows)] : []
        return sections
    }
}
