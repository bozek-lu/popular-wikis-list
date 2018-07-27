//
//  WikiCell.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class WikiCell: UICollectionViewCell {
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var wikiImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var articleCount: UILabel!
    @IBOutlet weak var discussionsCount: UILabel!
    @IBOutlet weak var videosCount: UILabel!
    @IBOutlet weak var articlesWidth: NSLayoutConstraint!
    @IBOutlet weak var discussionsWidth: NSLayoutConstraint!
    @IBOutlet weak var videosWidth: NSLayoutConstraint!
    
    let statsSegmentWidth: CGFloat = 70.0
    
    class var reuseStandardIdentifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        var screenWidth: CGFloat = UIScreen.main.bounds.size.width
        if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height {
            screenWidth = UIScreen.main.bounds.size.width / 2
        }
        //
        widthConstraint.constant = screenWidth - (2 * 40)
        
        wikiImage.addShadow()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse() 
        wikiImage.image = nil
    }
    
    func fill(with dataSource: WikiaItem) {
        title.text = dataSource.headline ?? dataSource.title
        desc.text = dataSource.desc
        
        let imgUrl = URL(string: dataSource.image)
        wikiImage.kf.indicatorType = .activity
        wikiImage.kf.setImage(with: imgUrl)
        
        updateVideosSegment(with: dataSource)
        updateArticlesSegment(with: dataSource)
        updatePostsSegment(with: dataSource)
    }
    
    func updateVideosSegment(with dataSource: WikiaItem) {
        let vidC = (Double(dataSource.stats.videos) / 1000).rounded()
        if vidC > 1 {
            videosCount.text = "\(Int(vidC))k"
            videosWidth.constant = statsSegmentWidth
        } else if dataSource.stats.videos > 0 {
            videosCount.text = "\(dataSource.stats.videos)"
            videosWidth.constant = statsSegmentWidth
        } else {
            videosWidth.constant = 0
        }
    }
    
    func updatePostsSegment(with dataSource: WikiaItem) {
        let discC = (Double(dataSource.stats.pages) / 1000).rounded()
        if discC > 1 {
            discussionsCount.text = "\(Int(discC))k"
            discussionsWidth.constant = statsSegmentWidth
        } else if dataSource.stats.pages > 0 {
            discussionsCount.text = "\(dataSource.stats.pages)"
            discussionsWidth.constant = statsSegmentWidth
        } else {
            discussionsWidth.constant = 0
        }
    }
    
    func updateArticlesSegment(with dataSource: WikiaItem) {
        let artC = (Double(dataSource.stats.articles) / 1000).rounded()
        if artC >= 1 {
            articleCount.text = "\(Int(artC))k"
            articlesWidth.constant = statsSegmentWidth
        } else if dataSource.stats.articles > 0 {
            articleCount.text = "\(dataSource.stats.articles)"
            articlesWidth.constant = statsSegmentWidth
        } else {
            articlesWidth.constant = 0
        }
    }
    
    
}
