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
    
    static func cellSize(width: CGFloat, name: String, author: String) -> CGSize {
        let nameTextSize = TextSize.size(name, font: UIFont.systemFont(ofSize: 16), width: width, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)).size
        let authorTextSize = TextSize.size(author, font: UIFont.systemFont(ofSize: 16), width: width, insets: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)).size
        let mainScreenWidth = UIScreen.main.bounds.width
        let coverImgHeight = (mainScreenWidth / 2).rounded()
        let thumbnailImgHeight = (mainScreenWidth / 3).rounded()
        return CGSize(width: width, height: nameTextSize.height + authorTextSize.height + 30 +  thumbnailImgHeight + coverImgHeight)
    }
}
