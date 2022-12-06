//
//  ProjectsListViewController.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation
import UIKit

class ProjectsListViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    var dataSource: ProjectsListDataSource?
    var viewModel : ProjectsListViewModel?
    var fullName: String?
    var projectDescription: String?
    
    init(configurator: ProjectsListConfigurator = ProjectsListConfigurator.shared) {
        
        super.init(nibName: nil, bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    // MARK: - Configurator
    
    private func configure(configurator: ProjectsListConfigurator = ProjectsListConfigurator.shared) {
        
        configurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate   = self
        tableView.register(UINib(nibName: ProjectCell.identifier, bundle: nil), forCellReuseIdentifier: ProjectCell.identifier)
        self.dataSource?.data.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        self.title = "Jetbrain's Projects"
        viewModel?.fetchProjectsList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let navC = segue.destination as? UINavigationController {
       let ProjectDetailsVC = navC.viewControllers[0] as? ProjectDetailsViewController
        ProjectDetailsVC!.fullName = fullName
          ProjectDetailsVC!.projectDescription = projectDescription
        }
    }
}

// MARK: UITableViewDelegate
extension ProjectsListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedRow = viewModel?.dataSource?.data.value.row(rowAt: indexPath) as? ProjectRowViewModel {
            fullName = selectedRow.full_name
            projectDescription = selectedRow.description
        }
       self.performSegue(withIdentifier: "ProjectDetailsViewController", sender: self)
    }
}

