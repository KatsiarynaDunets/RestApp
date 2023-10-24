//
//  PhotosCVCell.swift
//  RestApp
//
//  Created by Kate on 18/10/2023.
//

import Alamofire
import AlamofireImage
import UIKit

protocol PhotoCVCellDelegate: AnyObject {
    func didRequestDelete(for cell: PhotoCVCell)
}

class PhotoCVCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    weak var delegate: PhotoCVCellDelegate?
    
    var photo: Photo?
    var thumbnailUrl: String? {
        didSet {
            getThumbnail()
        }
    }
    
    private func getThumbnail() {
        guard let thumbnailUrl = thumbnailUrl else { return }
        NetworkService.getThumbnail(thumbnailURL: thumbnailUrl) { [weak self] image, _ in
            self?.activityIndicatorView.stopAnimating()
            self?.imageView.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // жест для отображения контекстного меню по долгому нажатию на ячейку
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(showContextMenu))
        self.addGestureRecognizer(longPressGesture)
    }
    
    func deletePhoto() {
        guard let photoID = photo?.id else {
            return
        }
        
        // код для удаления фото из базы данных на сервере
        NetworkService.deletePhoto(photoID: photoID) { [weak self] success, error in
            if success {
                // Успешно удалено из базы данных
                DispatchQueue.main.async {
                    self?.collectionView?.reloadData()
                }
            } else if let error = error {
                print(error)
            }
        }
    }
    
    @objc func showContextMenu(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { [weak self] _ in
                self?.delegate?.didRequestDelete(for: self)
            }
            
            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
            
            alertController.addAction(deleteAction)
            alertController.addAction(cancelAction)
        }
    }
}
