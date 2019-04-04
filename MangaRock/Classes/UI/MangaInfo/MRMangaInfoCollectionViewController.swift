//
//  MRMangaInfoCollectionViewController.swift
//  MangaRock
//
//  Created by Vien Tran on 2/16/19.
//  Copyright © 2019 Vien Tran. All rights reserved.
//

import UIKit
import CoreData
import IGListKit

private let reuseIdentifier = "Cell"

class MRMangaInfoCollectionViewController: UICollectionViewController, NSFetchedResultsControllerDelegate {
    
    var selectedManga: MRManga?
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.groupTableViewBackground
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "MRMangaInfoAuthorCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MRMangaInfoAuthorCollectionViewCell")
        
        // Do any additional setup after loading the view.
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    // MARK: - Fetched results controller
    var characterfetchedResultsController: NSFetchedResultsController<MRCharacter>? {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<MRCharacter> = MRCharacter.fetchRequest()
        guard let item = selectedManga else { return nil }
        fetchRequest.predicate = NSPredicate(format: "ANY mangas.mid == %i", item.mid)
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        _fetchedResultsController = fetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
    
    var _fetchedResultsController: NSFetchedResultsController<MRCharacter>? = nil
    
    // MARK: - GetData
    func getDesCharacters() -> MRDescriptionViewModel? {
        guard let characters = self.characterfetchedResultsController?.fetchedObjects, let manga = self.selectedManga else { return nil }
        let charactersModel = characters.compactMap { MRCharacterViewModel.fromCoreData(character: $0)}
        return MRDescriptionViewModel(manga: MRMangaViewModel.fromCoreData(manga: manga), characters: charactersModel)
    }
    
    func getMangaObject() -> MRMangaViewModel? {
        guard let manga = selectedManga else { return nil }
        return MRMangaViewModel.fromCoreData(manga: manga)
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.adapter.performUpdates(animated: true)
    }
    
}

// MARK: - ListAdapterDataSource
extension MRMangaInfoCollectionViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let manga = getMangaObject()! //self.getCharacters()!
        return [manga] + [self.getDesCharacters()!]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is MRMangaViewModel {
            return MRMangaInfoAuthorSectionController()
        } else {
            return MRMangaInfoDescriptionSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
