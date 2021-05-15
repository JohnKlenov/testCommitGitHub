//
//  TableViewCell.swift
//  testCommitGitHub
//
//  Created by Evgenyi on 5/12/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var bodyLable: UILabel!
    
    func configure(_ post: Post) {
        DispatchQueue.main.async {
            self.titleLable.text = post.title
            self.bodyLable.text = post.body
        }
    }
    
}
