//
//  UITableViewCellExtension.swift
//  JetbrainsProjects
//
//  Created by Aymen HECHMI on 6/12/2022.
//

import Foundation
import UIKit

/**
 Extension UITableViewCell that offer
 a reuse identifier which is the name of the class
 */
extension UITableViewCell {
    /// Default Identifier for reuse
    @objc static var identifier: String {
        return String(describing: self)
    }
}
