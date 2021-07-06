//
//  GalleryViewController.swift
//  GalleryTeamWork
//
//  Created by Tiko on 06.07.21.
//

import UIKit

enum FileType: String {
    case png
    case jpg
}

class GalleryViewController: UIViewController {

    // MARK: - Properties
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        cv.backgroundColor = .clear
        cv.registerNib(class: GalleryCell.self)
        return cv
    }()
    
    
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(self.collectionView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout(collectionView: collectionView)
    }
    
    private var imageUrls = [
        "https://images.unsplash.com/photo-1588392382834-a891154bca4d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2110&q=80",
        "https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
        "https://images.unsplash.com/photo-1418065460487-3e41a6c84dc5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
        "https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
        "https://images.unsplash.com/photo-1516475429286-465d815a0df7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80",
        "https://images.unsplash.com/photo-1586407014176-b592d6e2d16b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=882&q=80",
        "https://www.studyheights.com/uploads/quizzCategory/a98500a459e1b0bfbbfa43bf9da1e9b7.png",
        "https://cdns-images.dzcdn.net/images/cover/dc84135abb90e8ed09a500820831abca/500x500.jpg",
        "https://www.sparkyssurfschool.com/wp-content/uploads/turtle-500x500-1.jpg",
        "https://www.burkemuseum.org/sites/default/files/images/biology/herpetology/washington/green-sea-turtle-teaser-500x500.jpg",
        "https://www.noao.edu/image_gallery/images/d2/pelican_500.jpg",
        "https://cdn.wallpapersafari.com/97/28/aJCRnW.jpg",
        "https://images.unsplash.com/photo-1449673029231-c71b7b47cf5e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
        "https://files.muzli.space/a85074bd1a2a090021ccebca4ab15866.webp",
        "https://images.unsplash.com/photo-1432634372475-07b399e372ee?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
        "https://www.rigel.org.uk/lambda/m51/M51_VLA.jpg",
        "https://images.unsplash.com/photo-1449673029231-c71b7b47cf5e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
        "https://images.unsplash.com/photo-1444465693019-aa0b6392460d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1827&q=80",
        "https://pureai.com/-/media/ECG/PureAI/Images/IntroImages2018/CoolSpacySplit.jpg"
    ]
    
    func saveFile(with data: Data?, fileType: FileType) {
        let documentsDir = try? FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        
        let randomFileName = "\(UUID.init().uuidString).\(fileType.rawValue)"
        
        guard let filePath = documentsDir?.appendingPathComponent(randomFileName) else {return}
        
        do {
            try data?.write(to: filePath)
        } catch {
            print(error)
        }
    
        print(filePath)
    }
    
    private func setupLayout(collectionView: UICollectionView) {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(GalleryCell.self, for: indexPath)
        cell.setImage(with: self.imageUrls[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.imageUrls.count
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("bsbhbdjs")
        saveFile(with: self.imageUrls[indexPath.row], fileType: .jpg)
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.width * 0.3, height: self.collectionView.frame.width * 0.3)
    }
}
