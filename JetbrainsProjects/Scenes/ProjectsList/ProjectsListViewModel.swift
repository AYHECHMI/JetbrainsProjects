//
//  ProjectsListViewModel.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation
import  UIKit

struct ProjectsListViewModel {
    
    var service: ProjectsListServiceProtocol?
    
    weak var dataSource : GenericDataSource<TableSectionViewModel>?
    
    init(dataSource : GenericDataSource<TableSectionViewModel>?) {
        self.dataSource = dataSource
    }
    
    func fetchProjectsList() {
        service?.fetchProjectsList(completion: { (result:Result<[Project], APIError>) in
            switch result {
            case .success(let Projects) :
                
                let worker = ProjectsListWorker()
                let sections = worker.generateSectionsViewModel(Projects: Projects)
                self.dataSource?.data.value = sections
            case .failure(let error):
                print("-----> \(error)")
            }
        })
    }
}



struct ProjectsSectionViewModel: TableSectionViewModel {
    var dataModel: [TableRowViewModel]
}

struct ProjectRowViewModel : TableRowViewModel {
    
    var rowClass: AnyClass { return ProjectCell.self }
    var full_name: String
    var description: String
    var forks: Int
    var open_issues: Int
    var watchers: Int

    
    var rowHeight: CGFloat { return UITableView.automaticDimension }
    
    func configure(_ cell: UITableViewCell) {
        if let ProjectCell = cell as? ProjectCell {
          ProjectCell.configure(model: self)
        }
    }
    
}
