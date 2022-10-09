//
//  WebViewController.swift
//  NewsApp
//
//  Created by Leslie on 01/10/2022.
//

import Foundation
import WebKit
import RealmSwift



class WebViewController: UIViewController, WKNavigationDelegate{

    var webView = WKWebView()
    var passedArticle: NewsModelObject?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWebView()
        
        let addItem =  UIBarButtonItem( image: UIImage(systemName: "trash.slash"),style: .plain, target: self, action: #selector(alertController))
        addItem.tintColor = .red
        self.navigationItem.rightBarButtonItem = addItem
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
        
        let url = URL(string: passedArticle?.url ?? "")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func alertController(){
            let alert = UIAlertController(title: "Are you sure you want to delete this news?", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.deleteNewsDB()
                alert.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            
                
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
    }
    
    func deleteNewsDB(){
        let realm = try! Realm()
        do{
            try realm.write{
                realm.delete(passedArticle!)
         }
            
        } catch (let error) {
            let alert = UIAlertController(title: "Try Again", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    
}

