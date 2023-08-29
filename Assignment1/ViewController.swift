//
//  ViewController.swift
//  Assignment1
//
//  Created by A667271 A667271 on 23/8/2566 BE.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var repositories: [Repository] = []
    
    @IBOutlet weak var tableView: UITableView!
//    struct Avatar {
//        let title: String
//        let imagename: String
//    }
//
//    let data: [Avatar] = [
//        Avatar(title: "Wolf Chan", imagename: "skzoo1"),
//        Avatar(title: "LeeBit", imagename: "skzoo2"),
//        Avatar(title: "Dwaekki", imagename: "skzoo3"),
//        Avatar(title: "Jiniret", imagename: "skzoo4"),
//        Avatar(title: "HAN QUOKKA", imagename: "skzoo5"),
//        Avatar(title: "BbokAri", imagename: "skzoo6"),
//        Avatar(title: "PuppyM", imagename: "skzoo7"),
//        Avatar(title: "FoxI.Ny", imagename: "skzoo8")
//    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchRepository()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryCell
        let item = repositories[indexPath.row]
        if let imageUrl = URL(string: item.owner.avatarURL) {
            cell.repository?.text = item.fullname
            cell.avatar?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "placeholderImage"))
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension ViewController {
    func fetchRepository() {
        AF.request("https://api.github.com/search/repositories?q=ios&per_page=20&page=1")
            .validate()
            .responseDecodable(of: Repositories.self) { (response) in
                guard let repositories = response.value else { return }
                self.repositories = repositories.all
                print(repositories)
                
                self.tableView.reloadData()
            }
    }
}
