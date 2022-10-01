//
//  WebViewController.swift
//  NewsApp
//
//  Created by Leslie on 01/10/2022.
//

import Foundation
import WebKit



class WebViewController: UIViewController, WKNavigationDelegate{

    var webView = WKWebView()
    var passedURL: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWebView()
    }
    
    func setUpWebView(){
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.frame = CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1)
                
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor ),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            
        ])
        webView.navigationDelegate = self
        
        let url = URL(string: passedURL ?? "")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    
    
}

