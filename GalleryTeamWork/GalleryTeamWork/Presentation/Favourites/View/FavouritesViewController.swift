//
//  ViewController.swift


import UIKit

class FavouritesViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var favouritesViewModel: FavouritesViewModelProtocol!
    private var favouritesDataSource: FavouritesDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNib(class: FavouritesCell.self)
        
        configureViewModel()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        favouritesDataSource.refresh()
    }
    
    private func configureViewModel() {
        favouritesViewModel = FavouritesViewModel()
        favouritesDataSource = FavouritesDataSource(with: collectionView, viewModel: favouritesViewModel!, coordinator: coordinator!)
        
        favouritesDataSource.refresh()
    }

}


