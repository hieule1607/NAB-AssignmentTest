//
//  MRMangaInfoDescriptionSectionController.swift
//  MangaRock
//
//  Created by Hieu Lam on 4/4/19.
//  Copyright © 2019 Vien Tran. All rights reserved.
//

import UIKit
import IGListKit

final class MRMangaInfoDescriptionSectionController: ListSectionController {
    private var desCharacters: MRDescriptionViewModel?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return MRMangaInfoDescriptionCollectionViewCell.cellSize(width: collectionContext!.containerSize.width, text: desCharacters?.manga?.mangaDescription ?? "")
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: "MRMangaInfoDescriptionCollectionViewCell", bundle: nil, for: self, at: index) as? MRMangaInfoDescriptionCollectionViewCell else { fatalError() }
        cell.descriptionLbl.text = desCharacters?.manga?.mangaDescription
        cell.characterCollectionView.delegate = self
        cell.characterCollectionView.dataSource = self
        return cell
    }
    
    override func didUpdate(to object: Any) {
        desCharacters = object as? MRDescriptionViewModel
    }

}

extension MRMangaInfoDescriptionSectionController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return desCharacters?.characters?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MRCharacterCollectionViewCell", for: indexPath) as? MRCharacterCollectionViewCell, let characters = desCharacters?.characters else { fatalError() }
        let item = characters[indexPath.row]
        cell.characterNameLbl.text = item.name
        if let avatarImg = item.avatarImage {
            cell.avatarImageView.sd_setImage(with: URL(string: avatarImg), completed: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 122)
    }

}
