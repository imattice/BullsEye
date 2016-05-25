//
//  AboutViewController.swift
//  Bulls Eye
//
//  Created by Ike Mattice on 5/24/16.
//  Copyright © 2016 Michael Mattice. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
            if let htmlData = NSData(contentsOfFile: htmlFile) {
                let baseURL = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath)
                
                webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
            }
        }
    }
    
    
    
    @IBAction func closeAboutView() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var webView: UIWebView!
}
