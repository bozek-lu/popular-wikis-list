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
    var refresher:UIRefreshControl!
    
    private var selectedWiki: WikiaItem?
    
    private lazy var viewModel = ViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupCollectionView()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupCollectionView() {
        wikisCollectionView.register(UINib(nibName: WikiCell.reuseStandardIdentifier, bundle: nil), forCellWithReuseIdentifier: WikiCell.reuseStandardIdentifier)
        if let flowLayout = wikisCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
        }
        wikisCollectionView.delegate = self
        wikisCollectionView.dataSource = viewModel
        
        refresher = UIRefreshControl()
        wikisCollectionView!.alwaysBounceVertical = true
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        wikisCollectionView!.addSubview(refresher)
    }
    
    @objc private func refresh() {
        viewModel.currentBatch = 1
        viewModel.wikisList = []
        loadData()
    }
    
    private func loadData() {
        viewModel.loadData { [weak self] completion in
            self?.refresher.endRefreshing()
            switch completion {
            case .success:
                self?.wikisCollectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? WikiContentViewController {
            if let url = URL(string: selectedWiki?.url ?? "") {
                dest.wikiUrl = url
                dest.title = selectedWiki?.headline
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let wiki = viewModel.wikisList?[indexPath.row] else {
            return
        }
        print(wiki.url)
        selectedWiki = wiki
        performSegue(withIdentifier: "showWikiContent", sender: nil)
    }
}



