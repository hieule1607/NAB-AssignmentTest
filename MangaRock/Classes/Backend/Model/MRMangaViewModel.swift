//
//  MRMangaViewModel.swift
//  MangaRock
//
//  Created by Hieu Lam on 4/4/19.
//  Copyright © 2019 Vien Tran. All rights reserved.
//

import Foundation
import IGListKit

class MRMangaViewModel: NSObject {
    var authorName: String? = ""
    var coverImage: String? = ""
    var mangaDescription: String? = ""
    var mid: Int32 = 0
    var name: String? = ""
    var thumbnailImage: String? = ""
    
    init(authorName: String?, coverImage: String?, mangaDescription: String?, mid: Int32, name: String?, thumbnailImage: String?) {
        self.authorName = authorName
        self.coverImage = coverImage
        self.mangaDescription = mangaDescription
        self.mid = mid
        self.name = name
        self.thumbnailImage = thumbnailImage
    }
}

extension MRMangaViewModel {
    static func fromCoreData(manga: MRManga) -> MRMangaViewModel {
        // - Note: For avoiding Core Data threading violation, the following code should be wrapped in a
        // user.managedObjectContext?.performAndWait {}
        return MRMangaViewModel(authorName: manga.authorName, coverImage: manga.coverImage, mangaDescription: manga.mangaDescription, mid: manga.mid, name: manga.name, thumbnailImage: manga.thumbnailImage)
    }
}

extension MRMangaViewModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return NSString(string: "\(mid)")
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let toObject = object as? MRMangaViewModel else { return false }
        
        return self.authorName == toObject.authorName
            && self.coverImage == toObject.coverImage
            && self.mangaDescription == toObject.mangaDescription
            && self.mid == toObject.mid
            && self.name == toObject.name
            && self.thumbnailImage == toObject.thumbnailImage
    }
}
