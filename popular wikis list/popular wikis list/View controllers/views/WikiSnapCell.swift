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

class WikiSnapCell: UICollectionViewCell {
//    var widthConstraint: NSLayoutConstraint!
//    let backgroundHolder: UIView = {
//        let view = UIView()
//        view.clipsToBounds = true
//        view.backgroundColor = UIColor.clear
//        return view
//    }()
//
//    let wikiImage: UIImageView = {
//        let favicon = UIImageView()
//        favicon.backgroundColor = UIColor.clear
//        favicon.layer.cornerRadius = 2.0
//        favicon.layer.masksToBounds = false
//        return favicon
//    }()
    
//    let title: UILabel = {
//        let label = UILabel()
//        label.isUserInteractionEnabled = false
//        label.numberOfLines = 0
//        label.font = UIFont(name: "Rubik-Regular", size: 20)
//        label.textColor = UIColor.black
//        label.minimumScaleFactor = 0.5
//        return label
//    }()
    
    let desc: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Rubik-Medium", size: 14)
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    let articleCount: UILabel = {
//        let label = UILabel()
//        label.isUserInteractionEnabled = false
//        label.numberOfLines = 1
//        label.font = DynamicFontHelper.defaultHelper.DefaultSmallFontBold
//        label.textColor = UIColor.theme.tabTray.tabTitleText
//        return label
//    }()
//    let discussionsCount: UILabel = {
//        let label = UILabel()
//        label.isUserInteractionEnabled = false
//        label.numberOfLines = 1
//        label.font = DynamicFontHelper.defaultHelper.DefaultSmallFontBold
//        label.textColor = UIColor.theme.tabTray.tabTitleText
//        return label
//    }()
//    let videosCount: UILabel = {
//        let label = UILabel()
//        label.isUserInteractionEnabled = false
//        label.numberOfLines = 1
//        label.font = DynamicFontHelper.defaultHelper.DefaultSmallFontBold
//        label.textColor = UIColor.theme.tabTray.tabTitleText
//        return label
//    }()
//    var articlesWidth: NSLayoutConstraint!
//    var discussionsWidth: NSLayoutConstraint!
//    var videosWidth: NSLayoutConstraint!
    
//    let statsSegmentWidth: CGFloat = 70.0
    
    class var reuseStandardIdentifier: String {
        return String(describing: self)
    }
    
//        wikiImage.addShadow()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
//        contentView.addSubview(backgroundHolder)
//        backgroundHolder.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
//
//        backgroundHolder.addSubview(wikiImage)
//        wikiImage.snp.makeConstraints { (make) in
//            make.leading.equalTo(20)
//            make.top.equalTo(20)
//            make.width.height.equalTo(100)
//        }
//
//        backgroundHolder.addSubview(title)
//        title.snp.makeConstraints { (make) in
//            make.leading.equalTo(140)
//            make.top.equalTo(45)
//            make.trailing.equalTo(50)
//            make.height.equalTo(72)
//        }
        
        contentView.addSubview(desc)
        desc.snp.makeConstraints { (make) in
            let screenWidth: CGFloat = UIScreen.main.bounds.size.width
            make.edges.equalTo(self)
//            make.centerX.equalToSuperview()
            make.width.equalTo(screenWidth)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        backgroundHolder.frame = self.frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        wikiImage.image = nil
    }
    
    func fill(with dataSource: WikiaItem) {
//        title.text = dataSource.headline ?? dataSource.title
        desc.text = dataSource.desc
        
        let imgUrl = URL(string: dataSource.image)
//        wikiImage.kf.indicatorType = .activity
//        wikiImage.kf.setImage(with: imgUrl)
        
//        updateVideosSegment(with: dataSource)
//        updateArticlesSegment(with: dataSource)
//        updatePostsSegment(with: dataSource)
    }
    
//    func updateVideosSegment(with dataSource: WikiaItem) {
//        let vidC = (Double(dataSource.stats.videos) / 1000).rounded()
//        if vidC > 1 {
//            videosCount.text = "\(Int(vidC))k"
//            videosWidth.constant = statsSegmentWidth
//        } else if dataSource.stats.videos > 0 {
//            videosCount.text = "\(dataSource.stats.videos)"
//            videosWidth.constant = statsSegmentWidth
//        } else {
//            videosWidth.constant = 0
//        }
//    }
//
//    func updatePostsSegment(with dataSource: WikiaItem) {
//        let discC = (Double(dataSource.stats.pages) / 1000).rounded()
//        if discC > 1 {
//            discussionsCount.text = "\(Int(discC))k"
//            discussionsWidth.constant = statsSegmentWidth
//        } else if dataSource.stats.pages > 0 {
//            discussionsCount.text = "\(dataSource.stats.pages)"
//            discussionsWidth.constant = statsSegmentWidth
//        } else {
//            discussionsWidth.constant = 0
//        }
//    }
//
//    func updateArticlesSegment(with dataSource: WikiaItem) {
//        let artC = (Double(dataSource.stats.articles) / 1000).rounded()
//        if artC >= 1 {
//            articleCount.text = "\(Int(artC))k"
//            articlesWidth.constant = statsSegmentWidth
//        } else if dataSource.stats.articles > 0 {
//            articleCount.text = "\(dataSource.stats.articles)"
//            articlesWidth.constant = statsSegmentWidth
//        } else {
//            articlesWidth.constant = 0
//        }
//    }
    
    
}
