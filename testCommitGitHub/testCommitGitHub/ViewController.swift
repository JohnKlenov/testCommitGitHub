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
        
        objectNM.getAllPosts { [weak self] (post) in
            DispatchQueue.main.async {
                self?.massivePost = post
            }
        }
    }

    @IBAction func createPost(_ sender: Any) {
        let post = Post(userId: 333, title: "Hello world", body: "Swift is best language")
        objectNM.postCreate(post: post) { (postServer) in
            post.id = postServer.id
            print(post.id)
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "WoW!", message: "Your post was create", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    alert.dismiss(animated: true, completion: nil)
                }
                
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

