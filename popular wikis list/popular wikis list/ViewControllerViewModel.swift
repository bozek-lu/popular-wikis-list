//
//  ViewControllerViewModel.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 18/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit


class ViewControllerViewModel: NSObject {
    let randomTexts = ["Aenean dapibus urna a ullamcorper malesuada. Ut tempor.",
                       "Sed venenatis ligula massa, a vulputate ipsum fringilla eget. Ut justo erat, facilisis id rhoncus cursus, fringilla at.",
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lobortis nibh metus, elementum tempus libero ornare vitae. Etiam sed leo pretium, consectetur turpis non, dapibus purus. Suspendisse potenti. Ut ut eros nunc. Cras nulla justo, porttitor non sapien at, iaculis.",
                       "Maecenas pellentesque sed magna in congue. Sed non lacus in mi posuere scelerisque. Aenean.",
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget ex a velit tincidunt sodales. Donec elementum nisi at enim tempus, et rutrum erat semper. Phasellus ultricies est nec finibus."]
    
}

extension ViewControllerViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomTexts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WikiCell", for: indexPath) as! WikiCell
        cell.desc.text = randomTexts[indexPath.row]
        return cell
    }
}
