//
//  ViewController.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wikisCollectionView: UICollectionView!
    
    private lazy var viewModel = ViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wikisCollectionView.register(UINib(nibName: "WikiCell", bundle: nil), forCellWithReuseIdentifier: "WikiCell")
        if let flowLayout = wikisCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
        }
        wikisCollectionView.delegate = self
        wikisCollectionView.dataSource = viewModel
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func loadData() {
//        indicatorView.startAnimating()
        viewModel.loadData { [weak self] completion in
//            self?.indicatorView.stopAnimating()
            
            switch completion {
            case .success:
                self?.wikisCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}



