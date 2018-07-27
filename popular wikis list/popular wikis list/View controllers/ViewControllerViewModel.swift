//
//  ViewControllerViewModel.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit

let apiItemsLimit = 25

class ViewControllerViewModel: NSObject {
    enum Completion {
        case success
        case failure(Error)
    }
    
    var currentBatch = 1
    var totalItems = 0
    
    lazy var serviceBuilder: (Int, Int) -> ApiService = { limit, batch in
        return ApiServiceTopWikisList(limit: limit, batch: batch)
    }
    
    var service: ApiService?
    var wikisList: [WikiaItem]?
    
    func loadData(with completion: @escaping (Completion) -> Void) {
        service = serviceBuilder(apiItemsLimit, currentBatch)
        service?.success = { [weak self] data in
            if let wikisResponse = data as? TopWikisResponse {
                self?.totalItems = wikisResponse.total
                self?.wikisList = (self?.wikisList ?? []) + wikisResponse.items
                completion(.success)
            } else {
                let error = ApiErrorsFactory.makeError(for: .invalidDecodedData)
                completion(.failure(error))
            }
        }
        
        service?.failure = { error in
            completion(.failure(error))
        }
        
        service?.start()
    }
}

extension ViewControllerViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (wikisList ?? []).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WikiSnapCell.reuseStandardIdentifier, for: indexPath) as! WikiSnapCell
        if let wikisList = self.wikisList {
            let data = wikisList[indexPath.row]
            cell.fill(with: data)
        }
        
        return cell
    }
}

//extension ViewController: UICollectionViewDataSourcePrefetching {
//    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//
//
//        ImagePrefetcher(urls: urls).start()
//    }
//}
