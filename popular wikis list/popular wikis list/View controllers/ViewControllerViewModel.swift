//
//  ViewControllerViewModel.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit


class ViewControllerViewModel: NSObject {
    enum Completion {
        case success
        case failure(Error)
    }
    
    let apiItemsLimit = 25
    var currentBatch = 0
    
    lazy var serviceBuilder: (Int, Int) -> ApiService = { limit, batch in
        return ApiServiceTopWikisList(limit: limit, batch: batch)
    }
    
    
    private var service: ApiService?
    private var wikisList: [WikiaItem]?
    
    func loadData(with completion: @escaping (Completion) -> Void) {
        service = serviceBuilder(apiItemsLimit, currentBatch)
        service?.success = { [weak self] data in
            if let wikisResponse = data as? TopWikisResponse {
                self?.wikisList = wikisResponse.items
                completion(.success)
            } else {
                let error = ApiErrorsFactory.makeError(for: .invalidDecodedData)
                completion(.failure(error))
            }
            self?.currentBatch += 1
        }
        
        service?.failure = { error in
            completion(.failure(error))
            self.currentBatch += 1
        }
        
        service?.start()
    }
}

extension ViewControllerViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (wikisList ?? []).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WikiCell", for: indexPath) as! WikiCell
        if let wikisList = self.wikisList {
            let data = wikisList[indexPath.row]
            cell.fill(with: data)
        }
        return cell
    }
}
