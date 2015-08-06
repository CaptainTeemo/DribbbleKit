//
//  AuthWebViewController.swift
//  DribbbleKit
//
//  Created by Teemo on 8/5/15.
//  Copyright © 2015 teemo. All rights reserved.
//

import UIKit

class AuthWebViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    var authUrl: NSURL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureNavItem()
        
        if let url = self.authUrl {
            let request = NSURLRequest(URL: url, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 15)
            self.webView.loadRequest(request)
        }
    }
    
    func configureNavItem() {
        let dismissItem = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: "didPressDismiss")
        self.navigationItem.leftBarButtonItem = dismissItem
    }
    
    func didPressDismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//extension AuthWebViewController: UIWebViewDelegate {
//    
//}
