//
//  FavouritesViewModel.swift
//  GalleryTeamWork
//
//  Created by Mac User on 7/6/21.
//

import UIKit

protocol FavouritesViewModelProtocol: AnyObject {
    func fetchGalleryImages() throws -> [UIImage]
}

final class FavouritesViewModel: FavouritesViewModelProtocol {
    
    func fetchGalleryImages() throws -> [UIImage] {
        var images = [UIImage]()
        do {
            images = try ImagesFileManager.shared.fetchFromGallery()
        } catch {
            throw FileManagerErrors.FetchError
        }
        return images
    }

}
