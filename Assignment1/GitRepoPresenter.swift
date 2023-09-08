//
//  GitRepoPresenter.swift
//  Assignment1
//
//  Created by A667271 A667271 on 31/8/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

protocol RepositoryPresentationLogic {
    func presentRepositories(response: GitRepo.RepositoryLists.Response)
    func presentError(message: String)
}

class RepositoryPresenter: RepositoryPresentationLogic {
    func presentRepositories(response: GitRepo.RepositoryLists.Response) {
        let viewModel = GitRepo.RepositoryLists.ViewModel(result: response.result)
        viewController?.displayRepositories(viewModel: viewModel)
    }
    
    weak var viewController: RepositoryDisplayLogic?
    
    func presentError(message: String) {
        viewController?.displayError(message)
    }
}
