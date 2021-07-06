

import UIKit

protocol CoordinatorProtocol: AnyObject {
        
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func popViewController()
    func proceedToFavouritesVC(coordinator: CoordinatorProtocol)
    func proceedToEdit(with image: UIImage)
    func alertProblem()

    
}

