//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Leslie on 09/07/2022.
//

import UIKit

protocol SelectedNewsDelegate
{
    func choosenNews(article: Article)
}

class NewsViewController: UIViewController {
    
    let tableView =  UITableView()
    
    

    
    static var selectedNewsDelegate: SelectedNewsDelegate!
    
    var news =  [Article](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    struct Cell {
        static let newsCell = "NewsCeell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Latest news"
        configureTableView()
        fetchData()
        
    }
    
    func configureTableView(){
        self.view.addSubview(tableView)
        setupTableView()
        //table cell height
        tableView.rowHeight = 100
        tableView.allowsSelection = true
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        setupTableViewConstrainst()
        

    }

    func setupTableViewConstrainst(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
       
    }

    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: Cell.newsCell)

    }
    
    func fetchData() {
        Networking.sharedInstanceNetworking.getNews(urlString:  "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=91b2475438934ab4a7cd53dc42f8da51", expecting: NewsModel.self){
                [weak self] result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let response):
                            self?.news = response.articles
                    
                }
            }
    }
  
    

}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return news.count
    }
    
    func tableView(_ tableVie: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVie.dequeueReusableCell(withIdentifier: Cell.newsCell) as! NewsTableViewCell
        let newsCell = news[indexPath.row]
        cell.setNewsCell(news: newsCell)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailsViewController()
        vc.passedData = news[indexPath.row]
        navigationController?.pushViewController(vc, animated: false)
        //dataModel!.articles![indexPath.row])
        NewsViewController.selectedNewsDelegate?.choosenNews(article: news[indexPath.row])
        
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete =smplementation, return the number of sections
        return 1
    }

    

}
