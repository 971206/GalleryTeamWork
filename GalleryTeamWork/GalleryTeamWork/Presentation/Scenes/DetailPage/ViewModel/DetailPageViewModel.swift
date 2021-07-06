//
//  DetailPageViewModel.swift
//  GalleryTeamWork
//
//  Created by MacBook  on 06.07.21.
//

import  UIKit

protocol DetailPageViewModelProtocol: AnyObject {
    func saveInFavourites(imgName: String, image: UIImage) throws 
}

final class DetailPageViewModel: DetailPageViewModelProtocol {
    func saveInFavourites(imgName: String, image: UIImage) throws {
        do {
            try ImagesFileManager.shared.saveInFavourites(imgName: imgName, image: image)
        } catch FileManagerErrors.SaveError {
            throw FileManagerErrors.SaveError
        }
}
}
