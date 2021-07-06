//
//  TabBarViewController.swift
//  GalleryTeamWork
//
//  Created by MacBook  on 06.07.21.
//

import UIKit

class TabBarViewController: UITabBarController, Storyboarded, CoordinatorDelegate{
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let vc1 = self.viewControllers![0] as! GalleryViewController
//        vc1.coordinator = coordinator

        let vc2 = self.viewControllers![0] as! FavouritesViewController
        vc2.coordinator = coordinator
        
    }
    
}
