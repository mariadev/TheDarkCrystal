//
//  AppDelegate.swift
//  TheDarkCrystal
//
//  Created by Maria on 16/11/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var splitViewController:  UISplitViewController!
    
    var selectedViewControllerOnTabBar: UIViewController!
    
    var storiesTableViewController: StoriesTableViewController!
    var raceTableViewController: RaceTableViewController!
    var raceDetailViewController: RaceDetailViewController!
    var storiesDetailViewController: StoriesDetailViewController!
    
    var  raceDetailViewControllerNavigation: UINavigationController!
    var  storiesDetailViewControllerNavigagion: UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        
        let stories = RepositoryStory.local.stories
        let races = RepositoryCharacters.local.races
        
        storiesTableViewController = StoriesTableViewController(model: stories)
        raceTableViewController = RaceTableViewController(model: races)
        
        let lastStorySelected = storiesTableViewController.lastSelectedStory()
        let lastRaceSelected = raceTableViewController.lastSelectedRace()
        
        raceDetailViewController = RaceDetailViewController(model: lastRaceSelected )
        storiesDetailViewController = StoriesDetailViewController(model: lastStorySelected)
        
        raceDetailViewControllerNavigation = raceDetailViewController.wrappedInNavigation()
        storiesDetailViewControllerNavigagion = storiesDetailViewController.wrappedInNavigation()
        
        //Delegates
        storiesTableViewController.delegate = storiesDetailViewController
        raceTableViewController.delegate = raceDetailViewController
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            storiesTableViewController.delegate = storiesDetailViewController
            raceTableViewController.delegate = raceDetailViewController
              } else {
                storiesTableViewController.delegate = storiesTableViewController
                raceTableViewController.delegate = raceTableViewController
              }
        
        
        let tabBarController = UITabBarController()
        tabBarController.delegate = self
        tabBarController.viewControllers = [storiesTableViewController.wrappedInNavigation(), raceTableViewController.wrappedInNavigation()]
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 15)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Arial", size: 15)!], for: .selected)
        
        splitViewController = UISplitViewController()
        splitViewController.preferredDisplayMode = .allVisible
        splitViewController.viewControllers = [tabBarController, storiesDetailViewControllerNavigagion]
        
//        [storiesDetailViewController, raceDetailViewController].forEach {
//            $0?.navigationController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
//        }
        
        window?.rootViewController =  splitViewController
        
        return true
    }
}

extension AppDelegate: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navigationController = viewController as? UINavigationController,
            let viewController = navigationController.viewControllers.first else { return }
        
        let detailNavigation: UINavigationController
        if type(of: viewController ) == StoriesTableViewController.self {
            detailNavigation = storiesDetailViewControllerNavigagion
        } else {
            detailNavigation = raceDetailViewControllerNavigation
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
                  splitViewController.showDetailViewController(detailNavigation, sender: nil)
              }
        
    }
}
