//
//  ViewController.swift
//  WKWebViewTest
//
//  Created by petr on 10/17/16.
//  Copyright © 2016 soxjke. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.translatesAutoresizingMaskIntoConstraints = false
        let views = [
            "webView" : webView
        ]
        view.addSubview(webView)
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[webView]|", options: [.AlignAllLeading, .AlignAllTrailing], metrics: nil, views: views)
        constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[webView]|", options: [.AlignAllTop, .AlignAllBottom], metrics: nil, views: views))
        NSLayoutConstraint.activateConstraints(constraints)
        
        let path = NSBundle.mainBundle().pathForResource("ios - WKWebView fails to load images and CSS using loadHTMLString(_, baseURL_) - Stack Overflow", ofType: "htm")
        let url = NSURL(fileURLWithPath: path!)
        webView.loadHTMLString(try! String(contentsOfURL: url), baseURL: url.URLByDeletingLastPathComponent)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

