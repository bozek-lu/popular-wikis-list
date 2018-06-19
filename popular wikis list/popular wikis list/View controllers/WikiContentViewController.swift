//
//  WikiContentViewController.swift
//  popular wikis list
//
//  Created by Łukasz Bożek on 19/06/2018.
//  Copyright © 2018 lu. All rights reserved.
//

import UIKit

class WikiContentViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var wikiUrl = URL(string: "")
    
    override func viewDidLoad() {
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        if let url = wikiUrl {
            webView.loadRequest(URLRequest(url: url))
        }
    }
}
