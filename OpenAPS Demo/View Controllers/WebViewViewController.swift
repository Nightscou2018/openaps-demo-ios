//
//  WebViewViewController.swift
//  OpenAPS Demo
//
//  Created by Nathan Racklyeft on 5/7/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import UIKit
import WebKit


class WebViewViewController: UIViewController {

    var fileName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()

        if let fileName = fileName, HTMLDirectory = NSFileManager.defaultManager().HTMLDirectory {
            let HTMLFile = HTMLDirectory.URLByAppendingPathComponent(fileName)

            webView.loadFileURL(HTMLFile, allowingReadAccessToURL: HTMLDirectory)
        }
    }

    override func loadView() {
        view = WKWebView(frame: CGRect(x: 0, y: 0, width: 600, height: 600), configuration: WKWebViewConfiguration())
    }

    private var webView: WKWebView! {
        return view as! WKWebView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        webView.scrollView.contentInset.top = topLayoutGuide.length
        webView.scrollView.contentInset.bottom = bottomLayoutGuide.length

        webView.scrollView.scrollIndicatorInsets = webView.scrollView.contentInset
    }
}
