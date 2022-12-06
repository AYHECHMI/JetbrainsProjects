//
//  ProjectDetailsViewController.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import UIKit

class ProjectDetailsViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var fullName : String?
    var projectDescription : String?
    
    
    init(configurator: ProjectDetailsConfigurator = ProjectDetailsConfigurator.shared) {
        
        super.init(nibName: nil, bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    // MARK: - Configurator
    
    private func configure(configurator: ProjectDetailsConfigurator = ProjectDetailsConfigurator.shared) {
        
        configurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = fullName
      descriptionLabel.text = projectDescription
    }
    
    private func displayErrorMessage(errorMessage: String?) {
        
    }
}
