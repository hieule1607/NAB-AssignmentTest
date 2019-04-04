//
//  MRMangaInfoDescriptionCollectionViewCell.swift
//  MangaRock
//
//  Created by Hieu Lam on 4/4/19.
//  Copyright © 2019 Vien Tran. All rights reserved.
//

import UIKit
import SDWebImage

class MRMangaInfoDescriptionCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var characterCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        characterCollectionView.register(UINib(nibName: "MRCharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MRCharacterCollectionViewCell")
        
        if let flowlayout = characterCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowlayout.minimumLineSpacing = 16
        }
    }
    
    static func cellSize(width: CGFloat, text: String) -> CGSize {
        let textSize = TextSize.size(text, font: UIFont.systemFont(ofSize: 14), width: width, insets: UIEdgeInsets(top: 0, left: 16, bottom: 10, right: 16)).size
        return CGSize(width: width, height: textSize.height + 72 + 36 + 122)
    }
}

//extension MRMangaInfoDescriptionCollectionViewCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.size.width, height: 100)
//    }
//}
