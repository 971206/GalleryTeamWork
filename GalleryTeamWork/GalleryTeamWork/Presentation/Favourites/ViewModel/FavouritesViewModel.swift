//
//  FavouritesViewModel.swift
//  GalleryTeamWork
//
//  Created by Mac User on 7/6/21.
//

import UIKit

protocol FavouritesViewModelProtocol: AnyObject {
    func fetchFromFavourites() throws -> UIImage
}

final class FavouritesViewModel: FavouritesViewModelProtocol {
    
    func fetchFromFavourites() throws -> UIImage {
        var images = [UIImage]()
        do {
            images = try ImagesFileManager.shared.fetchFromFavourites()
                //.last ?? UIImage(named: "emptyAlbum")!
        } catch {
            throw FileManagerErrors.FetchError
        }
        return images.last ?? UIImage(named: "emptyAlbum")!
    }

}
