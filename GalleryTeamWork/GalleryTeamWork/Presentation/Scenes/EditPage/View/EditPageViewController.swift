//
//  EditPageViewController.swift
//  GalleryTeamWork
//
//  Created by MacBook  on 06.07.21.
//

import UIKit

class EditPageViewController: BaseViewController, UIScrollViewDelegate {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageViewWidth: NSLayoutConstraint!
    @IBOutlet var imageViewHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setImageToCrop(image: imageView.image!)

    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
    }
    
    func setImageToCrop(image:UIImage){
        imageView.image = image
        imageViewWidth.constant = image.size.width
        imageViewHeight.constant = image.size.height
        let scaleHeight = scrollView.frame.size.width
        let scaleWidth = scrollView.frame.size.height
        let maxScale = max(scaleWidth, scaleHeight)
        scrollView.minimumZoomScale = maxScale
        scrollView.zoomScale = maxScale
    }
    
    
    @IBAction func onCrop(_ sender: Any) {
        let scale:CGFloat = 1/scrollView.zoomScale
        let x:CGFloat = scrollView.contentOffset.x * scale
        let y:CGFloat = scrollView.contentOffset.y * scale
        let width:CGFloat = scrollView.frame.size.width * scale
        let height:CGFloat = scrollView.frame.size.height * scale
        let croppedCGImage = imageView.image?.cgImage?.cropping(to: CGRect(x: x, y: y, width: width, height: height))
        let croppedImage = UIImage(cgImage: croppedCGImage!)
        setImageToCrop(image: croppedImage)
    }
    
    
    @IBAction func onRotate(_ sender: Any) {
        imageView.transform = imageView.transform.rotated(by: .pi / 2)
    }
}
