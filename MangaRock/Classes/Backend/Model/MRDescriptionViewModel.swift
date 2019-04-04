//
//  MRDescriptionViewModel.swift
//  MangaRock
//
//  Created by Hieu Lam on 4/4/19.
//  Copyright © 2019 Vien Tran. All rights reserved.
//

import Foundation
import IGListKit

class MRDescriptionViewModel: NSObject {
    var manga: MRMangaViewModel?
    var characters: [MRCharacterViewModel]? = []
    
    init(manga: MRMangaViewModel?, characters: [MRCharacterViewModel]?) {
        self.manga = manga
        self.characters = characters
    }
}

extension MRDescriptionViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return NSString(string: "MR\(manga?.mid ?? 0)\(characters?.count ?? 0)")
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let toObject = object as? MRDescriptionViewModel else { return false }
        
        return self.manga == toObject.manga
            && self.characters == toObject.characters
    }
}
