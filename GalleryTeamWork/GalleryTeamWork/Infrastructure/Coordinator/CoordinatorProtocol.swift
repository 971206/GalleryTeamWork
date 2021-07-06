

import UIKit

protocol CoordinatorProtocol: AnyObject {
        
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    //     func proceedToFavouritesVC(image: UIImage, coordinator: CoordinatorProtocol?)
    func proceedToFavouritesVC(coordinator: CoordinatorProtocol?)


}
