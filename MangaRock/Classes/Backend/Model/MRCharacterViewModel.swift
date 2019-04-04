//
//  MRCharacterViewModel.swift
//  MangaRock
//
//  Created by Hieu Lam on 4/4/19.
//  Copyright © 2019 Vien Tran. All rights reserved.
//

import Foundation
import IGListKit

class MRCharacterViewModel: NSObject {
    var avatarImage: String? = ""
    var cid: Int32 = 0
    var name: String? = ""
    
    init(avatarImage: String?, cid: Int32, name: String?) {
        self.avatarImage = avatarImage
        self.cid = cid
        self.name = name
    }
}

extension MRCharacterViewModel {
    static func fromCoreData(character: MRCharacter) -> MRCharacterViewModel {
        // - Note: For avoiding Core Data threading violation, the following code should be wrapped in a
        // user.managedObjectContext?.performAndWait {}
        return MRCharacterViewModel(avatarImage: character.avatarImage, cid: character.cid, name: character.name)
    }
}

extension MRCharacterViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return NSString(string: "\(cid)")
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let toObject = object as? MRCharacterViewModel else { return false }
        
        return self.avatarImage == toObject.avatarImage
            && self.cid == toObject.cid
            && self.name == toObject.name
    }
}
