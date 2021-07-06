//
//  FavouritesDataSource.swift
//  GalleryTeamWork
//
//  Created by Mac User on 7/6/21.
//

import UIKit

class FavouritesDataSource: NSObject {
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var viewModel: FavouritesViewModelProtocol!
    private var coordinator: CoordinatorProtocol!
    private var images = [UIImage]()
    
    // MARK: - Init
    init(with collectionView: UICollectionView, viewModel: FavouritesViewModelProtocol, coordinator: CoordinatorProtocol) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.viewModel = viewModel
        self.coordinator = coordinator
    }
    
    func refresh() {
        do {
            images.append(try viewModel.fetchFromFavourites())
            collectionView.reloadData()
            
        } catch {
            print("Unknow Error, while loading images please try again.")
        }
    }
    
    
}

extension FavouritesDataSource:  UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(FavouritesCell.self, for: indexPath)
        cell.configure(with: images[indexPath.row])
        return cell
    }
    
}

extension FavouritesDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension FavouritesDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/3.0
        let height = width

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

