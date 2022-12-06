//
//  ProjectDetailsWorker.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation

class ProjectDetailsWorker {
    
    /**
     This method will do a single work
     Called from the interactor
     */
    func generateDetailsViewModel(Project: Project) -> ProjectDetailsUIModel {

        return ProjectDetailsUIModel(fullName: Project.fullName, description: Project.projetDescription ?? "")
        
    }
}
