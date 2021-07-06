//
//  EditPage.swift
//  GalleryTeamWork
//
//  Created by MacBook  on 06.07.21.
//

import UIKit

class DetailPageViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var OnEdit: UIBarButtonItem!
    private var viewModel: DetailPageViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func onEdit(_ sender: Any) {
//
       let vc = UIStoryboard(name: "EditPageViewController", bundle: nil)
        let sb = vc.instantiateViewController(withIdentifier: "EditPageViewController")
        navigationController?.pushViewController(sb, animated: true)
        
//        coordinator?.proceedToEdit(with: "Screenshot")
        
    }
    @IBAction func onShare(_ sender: Any) {
        coordinator?.alertProblem()
    }
    @IBAction func onFavorite(_ sender: Any) {
        addToFavorites()
    }
    
    @IBAction func onDelete(_ sender: Any) {
        
    }
    
    private func addToFavorites() {
        viewModel = DetailPageViewModel()
        try? viewModel.saveInFavourites(imgName: UUID().uuidString, image: imageView.image!)
    }
}
