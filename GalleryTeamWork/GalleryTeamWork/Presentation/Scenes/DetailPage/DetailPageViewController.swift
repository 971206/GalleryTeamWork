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
    }
    @IBAction func onFavorite(_ sender: Any) {
    }
    
    @IBAction func onDelete(_ sender: Any) {
    }
}
