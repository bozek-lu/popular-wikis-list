//
//  ViewController.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
//    @IBOutlet weak var wikisCollectionView: UICollectionView!
    var collectionView: UICollectionView = {
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        layout.scrollDirection = .vertical
        
        let result = UICollectionView(frame: frame, collectionViewLayout: layout)
        result.backgroundColor = UIColor.collectionBgr
        result.translatesAutoresizingMaskIntoConstraints = false
        
        return result
        
    }()
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
//        let layout = UICollectionViewFlowLayout()
//        let w = self.view.frame.width - 20
//        layout.estimatedItemSize = CGSize(width: 300, height: 150)
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        collectionView.register(WikiSnapCell.self, forCellWithReuseIdentifier: WikiSnapCell.reuseStandardIdentifier)
//        collectionView.register(UINib(nibName: WikiCell.reuseStandardIdentifier, bundle: nil), forCellWithReuseIdentifier: WikiCell.reuseStandardIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = viewModel
        
        refresher = UIRefreshControl()
        collectionView.alwaysBounceVertical = true
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.addSubview(refresher)
        
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
                self?.collectionView.reloadData()
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let wikisList = viewModel.wikisList else {
            return
        }
        if wikisList.count < viewModel.totalItems && indexPath.row >= wikisList.count - 1 {
            viewModel.currentBatch += 1
            loadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let wiki = viewModel.wikisList?[indexPath.row] else {
            return
        }
        print(wiki.url)
        selectedWiki = wiki
        performSegue(withIdentifier: "showWikiContent", sender: nil)
    }
}
