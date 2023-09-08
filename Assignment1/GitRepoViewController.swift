//
//  ViewController.swift
//  Assignment1
//
//  Created by A667271 A667271 on 24/8/2566 BE.
//

import UIKit
import Alamofire
import Kingfisher

protocol RepositoryDisplayLogic: AnyObject {
    func displayRepositories(viewModel: GitRepo.RepositoryLists.ViewModel)
    func displayError(_ message: String)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RepositoryDisplayLogic {
   
    var repositories: [Repository] = []
    var interactor: RepositoryBusinessLogic?
    var router: (NSObjectProtocol & GitRepoRoutingLogic & GitRepoDataPassing)?    
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup

    private func setup()
    {
        let viewController = self
        let interactor = RepositoryInteractor()
        let presenter = RepositoryPresenter()
        let router = GitRepoRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchRepositories()
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryCell
        let item = repositories[indexPath.row]
        if let imageUrl = URL(string: item.owner.avatarURL) {
            cell.repository?.text = item.fullName
            cell.avatar?.kf.setImage(with: imageUrl, placeholder: UIImage(named: "placeholderImage"))
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func fetchRepositories() {
        interactor?.fetchRepositories(request: GitRepo.RepositoryLists.Request())
    }
    
    func displayRepositories(viewModel: GitRepo.RepositoryLists.ViewModel) {
        self.repositories = viewModel.result
        tableView.reloadData()
    }

//    func displayRepositories(_ repositories: [Repository]) {
//        self.repositories = repositories
//        tableView.reloadData()
//    }

    func displayError(_ message: String) {
        print("Error: \(message)")
    }
}
