//
//  FileManager.swift
//  GalleryTeamWork
//
//  Created by Mac User on 7/6/21.
//


import UIKit

class ImagesFileManager {
    
    static let shared = ImagesFileManager()
    
    private let manager = FileManager.default
    
    private var docsDirectoryURL: URL? {
        try? manager.url(for: .applicationSupportDirectory,
                         in: .allDomainsMask,
                         appropriateFor: nil,
                         create: false)
    }
    
    private init() {
        AlbomsDirectory()
        GalleryDirectory()
        FavouritesDirectory()
        print(docsDirectoryURL!)
    }
    
    private func AlbomsDirectory() {
        guard let directory = docsDirectoryURL else {return}
        let newDirectoryName = directory.appendingPathComponent("Album")
       
        do {
            try manager.createDirectory(at: newDirectoryName,
                                        withIntermediateDirectories: true,
                                        attributes: [:])
        } catch {
            print(error)
        }
    }
    
    private func GalleryDirectory() {
        guard let directory = docsDirectoryURL else {return}
        let albumDirectory = directory.appendingPathComponent("Album")
        let newGalleryDirectory = albumDirectory.appendingPathComponent("Gallery")
       
        do {
            try manager.createDirectory(at: newGalleryDirectory,
                                        withIntermediateDirectories: true,
                                        attributes: [:])
        } catch {
            print(error)
        }
    }
    
    private func FavouritesDirectory() {
        guard let directory = docsDirectoryURL else {return}
        let albumDirectory = directory.appendingPathComponent("Album")
        let newGalleryDirectory = albumDirectory.appendingPathComponent("Favourite Images")
       
        do {
            try manager.createDirectory(at: newGalleryDirectory,
                                        withIntermediateDirectories: true,
                                        attributes: [:])
        } catch {
            print(error)
        }
    }
    
    
    func saveInGallery(imgName: String, image: UIImage) throws {
        
        guard let directory = docsDirectoryURL else {throw FileManagerErrors.SaveError}
        
        let album = directory.appendingPathComponent("Album")
        let gallery = album.appendingPathComponent("Gallery")
        let noteUrl = gallery.appendingPathComponent("\(imgName).jpeg")
        
        guard let jpegData = image.jpeg else {throw FileManagerErrors.SaveError}
        
        manager.createFile(atPath: noteUrl.path,
                            contents: jpegData,
                            attributes: [:])
    }
    
    func saveInFavourites(imgName: String, image: UIImage) throws {
        
        guard let directory = docsDirectoryURL else {throw FileManagerErrors.SaveError}
        
        let dirName = directory.appendingPathComponent("Album")
        let galleryDir = dirName.appendingPathComponent("Favourite Images")
        let noteUrl = galleryDir.appendingPathComponent("\(imgName).jpeg")
        
        guard let jpegData = image.jpeg else {throw FileManagerErrors.SaveError}
        
        manager.createFile(atPath: noteUrl.path,
                            contents: jpegData,
                            attributes: [:])
    }
    
    func fetchFromGallery() throws -> [UIImage] {
        guard let directory = docsDirectoryURL else {throw FileManagerErrors.FetchError}
        let albumDir = directory.appendingPathComponent("Album")
        let imagesDir = albumDir.appendingPathComponent("Gallery")
        var images = [UIImage]()
        
        let fetchedFiles = try FileManager.default.contentsOfDirectory(at: imagesDir, includingPropertiesForKeys: nil, options: [])
        
        for image in fetchedFiles {
            do {
                let data = try Data(contentsOf: image)
                guard let img = data.img else {continue}
                images.append(img)
            } catch {
                throw FileManagerErrors.unknownError
            }
        }
                
        return images
    }
    
    func fetchFromFavourites() throws -> [UIImage] {
        guard let directory = docsDirectoryURL else {throw FileManagerErrors.FetchError}
        let albumDir = directory.appendingPathComponent("Album")
        let imagesDir = albumDir.appendingPathComponent("Favourite Images")
        var images = [UIImage]()
        
        let fetchedFiles = try FileManager.default.contentsOfDirectory(at: imagesDir, includingPropertiesForKeys: nil, options: [])
        
        for image in fetchedFiles {
            do {
                let data = try Data(contentsOf: image)
                guard let img = data.img else {continue}
                images.append(img)
            } catch {
                throw FileManagerErrors.unknownError
            }
        }
                
        return images
    }
    
    func fetchAlbums() throws -> [String] {
        guard let directory = docsDirectoryURL else {throw FileManagerErrors.FetchError}
        let albumDirectory = directory.appendingPathComponent("Album")
        var albums = [String]()
        
        let fetchedAlbums = try FileManager.default.contentsOfDirectory(at: albumDirectory, includingPropertiesForKeys: nil, options: [])
        
        for album in fetchedAlbums {
            let myAlbum = album.absoluteString
            albums.append(myAlbum)
        }
                
        return albums
    }
    
    
}


enum FileManagerErrors: Error {
    case SaveError
    case FetchError
    case unknownError
}

extension Data {
    var img: UIImage? { UIImage(data: self) }
}

extension UIImage {
    var png: Data? { pngData() }
    var jpeg: Data? { jpegData(compressionQuality: 1) }
}
