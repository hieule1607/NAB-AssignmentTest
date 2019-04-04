//
//  MRMangaInfoAuthorCollectionViewCell.swift
//  MangaRock
//
//  Created by Hieu Lam on 4/4/19.
//  Copyright © 2019 Vien Tran. All rights reserved.
//

import UIKit

class MRMangaInfoAuthorCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var mangaNameLbl: UILabel!
    @IBOutlet weak var mangaAuthorLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbnailImageView.layer.borderWidth = 0.5
        thumbnailImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
