

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    // MARK: - Internal properties
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
            }
    
    func start() {
        let vc = TabBarViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
//        let tabBarVC = TabBarViewController()
//        self.window!.rootViewController = tabBarVC
//        self.window!.makeKeyAndVisible()
//        self.window?.overrideUserInterfaceStyle = .light
    }
    

}
