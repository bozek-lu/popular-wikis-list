//
//  WikiCell.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit
import Kingfisher

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
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 40)
        
        wikiImage.addShadow()
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
        
        let vidC = dataSource.stats.videos / 1000
        if vidC >= 1 {
            videosCount.text = "\(vidC)k"
            videosWidth.constant = statsSegmentWidth
        } else {
            videosWidth.constant = 0
        }
        
        let artC = dataSource.stats.articles / 1000
        if artC >= 1 {
            articleCount.text = "\(artC)k"
            articlesWidth.constant = statsSegmentWidth
        } else {
            articlesWidth.constant = 0
        }
        
        let discC = dataSource.stats.pages / 1000
        if discC >= 1 {
            discussionsCount.text = "\(discC)k"
            discussionsWidth.constant = statsSegmentWidth
        } else {
            discussionsWidth.constant = 0
        }
    }
}
