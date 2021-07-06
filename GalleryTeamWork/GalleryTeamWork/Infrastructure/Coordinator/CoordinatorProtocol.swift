

import UIKit

protocol CoordinatorProtocol: AnyObject {
        
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func proceedToEdit(with image: UIImage)
    func alertProblem()

    
}

