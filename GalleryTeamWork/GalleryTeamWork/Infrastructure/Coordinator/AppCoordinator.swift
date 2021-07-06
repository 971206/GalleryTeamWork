

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
        let vc = DetailPageViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

    }
    
    func proceedToEdit(with image: UIImage) {
        let vc = EditPageViewController.instantiateFromStoryboard()
        vc.imageView.image = image
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
     func alertProblem() {
        let alert = UIAlertController(title: "Coming Soon", message: "This Feature will be available soon" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        self.navigationController?.present(alert, animated: true)
    }

    

}
