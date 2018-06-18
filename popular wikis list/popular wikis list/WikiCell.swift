//
//  WikiCell.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit

class WikiCell: UICollectionViewCell {
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var wikiImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenWidth - (2 * 40)
        
        wikiImage.addShadow()
    }
}
