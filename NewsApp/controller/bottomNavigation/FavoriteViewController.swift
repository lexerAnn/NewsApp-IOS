//
//  FavoriteViewController.swift
//  NewsApp
//
//  Created by Leslie on 09/07/2022.
//

import UIKit
import RealmSwift

class FavoriteViewController: UIViewController {
    
    let tableView = UITableView()

    
    struct SavedNewsCell {
        static let newsCell = "SavedCell"
    }
    

    var news =  [NewsModelObject](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"

        /* If view controller's parent is a direct child of UINavigationController e.g. a child of embedded tab view controller */
       // self.parent?.title = "Title Here"

        configureTableView()
        setupTableViewConstrainst()
        

        // Access all dogs in the realm
      
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let realm = try! Realm()
        let savedNews = realm.objects(NewsModelObject.self)
        print("Saved \(Array(savedNews).reversed())")
        news = Array(savedNews.reversed())
        
        /* If view controller is a direct child of UINavigationController */
        

    }

    func configureTableView(){
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: SavedNewsCell.newsCell)
        
        tableView.rowHeight = 100
        tableView.allowsSelection = true
        tableView.clipsToBounds = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        
    }
    
    func setupTableViewConstrainst(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
       
    }
}
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedNewsCell.newsCell) as! NewsTableViewCell
        let newsCell = news[indexPath.row]
        cell.setSavedNewsCell(news: newsCell)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(news[indexPath.row].url)
        
        let vc = WebViewController()
        vc.passedArticle = news[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)

        //dataModel!.articles![indexPath.row])
       // NewsViewController.selectedNewsDelegate?.choosenNews(article: news[indexPath.row])

    }
    func numberOfSections(in tableView: UITableView) -> Int {
       // #warning Incomplete =smplementation, return the number of sections
       return 1
   }

    
}
