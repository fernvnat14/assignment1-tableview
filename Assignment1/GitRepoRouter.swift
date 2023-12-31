//
//  GitRepoRouter.swift
//  Assignment1
//
//  Created by A667271 A667271 on 31/8/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol GitRepoRoutingLogic
{
    func routeToSomewhere()
}

protocol GitRepoDataPassing
{
    var dataStore: GitRepoDataStore? { get }
}

class GitRepoRouter: NSObject, GitRepoRoutingLogic, GitRepoDataPassing
{
    func routeToSomewhere() {
    }
    
    
    weak var viewController: UIViewController?
    var dataStore: GitRepoDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: GitRepoViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: GitRepoDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
