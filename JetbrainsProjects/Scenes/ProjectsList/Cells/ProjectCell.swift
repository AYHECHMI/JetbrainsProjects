//
//  ProjectCell.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import UIKit

class ProjectCell: UITableViewCell {

    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var forks: UILabel!
    @IBOutlet weak var openIssues: UILabel!
    @IBOutlet weak var watchers: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func configure(model: ProjectRowViewModel) {
        fullName.text = model.full_name
        forks.text = String(model.forks)
        openIssues.text = String(model.open_issues)
        watchers.text = String(model.watchers)
    }
}
