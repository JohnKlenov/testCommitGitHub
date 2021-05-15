//
//  ViewController.swift
//  testCommitGitHub
//
//  Created by Evgenyi on 5/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    var objectNM = NetworkManager()
    
    var massivePost:[Post] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "CellID")
        }
    }
    
    override func viewDidLoad() {
        
        objectNM.getAllPosts { (post) in
            DispatchQueue.main.async {
                self.massivePost = post
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        massivePost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TableViewCell
        cell.configure(massivePost[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
}

