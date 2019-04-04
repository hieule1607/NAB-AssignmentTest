//
//  MRMangaInfoAuthorSectionController.swift
//  MangaRock
//
//  Created by Hieu Lam on 4/4/19.
//  Copyright © 2019 Vien Tran. All rights reserved.
//

import UIKit
import IGListKit
import SDWebImage

final class MRMangaInfoAuthorSectionController: ListSectionController {
    private var manga: MRMangaViewModel?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return MRMangaInfoAuthorCollectionViewCell.cellSize(width: collectionContext!.containerSize.width, name: manga?.name ?? "", author: manga?.authorName ?? "")
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "MRMangaInfoAuthorCollectionViewCell", bundle: nil, for: self, at: index) as? MRMangaInfoAuthorCollectionViewCell else { fatalError() }
        cell.mangaNameLbl.text = manga?.name
        cell.mangaAuthorLbl.text = manga?.authorName
        if let thumbnailImage = manga?.thumbnailImage, let coverImage = manga?.coverImage {
            cell.coverImageView.sd_setImage(with: URL(string: coverImage), completed: nil)
            cell.thumbnailImageView.sd_setImage(with: URL(string: thumbnailImage), completed: nil)
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        manga = object as? MRMangaViewModel
    }
}
