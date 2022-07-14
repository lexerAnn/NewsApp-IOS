//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Leslie on 09/07/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    var passedData: Article?
    
    var newsImage = UIImageView()
    var newsContent =  UILabel()
    var newsTitle = UILabel()
    var newsArthurLogo = UIImageView()
    var newsArthur = UILabel()
    var newsDate = UILabel()



    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewsTitle()
        setupNewsImage()
        setupNewsArthurLogo()
        setupNewsArthur()
        setupNewsDate()
        setupNewsTitleConstraints()
        setuoNewsConstraints()
        setupNewsArthurConstraints()
        setupNewsArthurLogoConstraints()
        setupNewsDateConstraints()
        
    }
    func setupNewsTitle(){
        view.addSubview(newsTitle)
        newsTitle.text = passedData?.title
        newsTitle.numberOfLines = 0
        newsTitle.font = UIFont.boldSystemFont(ofSize: 20)
    }
    func setupNewsImage(){
        view.addSubview(newsImage)
        newsImage.layer.cornerRadius = 20
    
        guard let url = passedData?.urlToImage else {
            return
        }
        
        newsImage.load(url: url)
        
    }
    func setupNewsTitleConstraints(){
        newsTitle.clipsToBounds = true
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        newsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        newsTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        //newsTitle.heightAnchor.constraint(equalToConstant: 220).isActive = true
        newsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func setuoNewsConstraints(){
        newsImage.clipsToBounds = true
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 20).isActive = true
        newsImage.leadingAnchor.constraint(equalTo: newsTitle.leadingAnchor, constant: 0).isActive = true
        newsImage.trailingAnchor.constraint(equalTo: newsTitle.trailingAnchor, constant: 0).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 220).isActive = true
        newsImage.centerXAnchor.constraint(equalTo: newsTitle.centerXAnchor).isActive = true
        
    }
    func setupNewsArthurLogo(){
        view.addSubview(newsArthurLogo)
        newsArthurLogo.image = UIImage(systemName: "person")
        newsArthurLogo.tintColor = .black
    }
    func setupNewsArthurLogoConstraints(){
        newsArthurLogo.translatesAutoresizingMaskIntoConstraints = false
        newsArthurLogo.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10).isActive = true
        newsArthurLogo.leadingAnchor.constraint(equalTo: newsImage.leadingAnchor, constant: 0).isActive = true
    }
    
    func setupNewsArthur(){
        view.addSubview(newsArthur)
        newsArthur.text = passedData?.author
        newsArthur.font = UIFont.systemFont(ofSize: 16)
    }
    func setupNewsArthurConstraints(){
        newsArthur.translatesAutoresizingMaskIntoConstraints = false
        newsArthur.topAnchor.constraint(equalTo: newsArthurLogo.topAnchor, constant: 0).isActive = true
        newsArthur.leadingAnchor.constraint(equalTo: newsArthurLogo.leadingAnchor, constant: 26).isActive = true
    }
    
    func setupNewsDate(){
        view.addSubview(newsDate)
        newsDate.text = passedData?.publishedAt
        newsDate.font = UIFont.systemFont(ofSize: 16)
    }
    func setupNewsDateConstraints(){
        newsDate.translatesAutoresizingMaskIntoConstraints = false
        newsDate.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10).isActive = true
        newsDate.trailingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 0).isActive = true
    }

}
extension DetailsViewController: SelectedNewsDelegate{
    func choosenNews(article: Article) {
        print("selected News\(article.urlToImage)")
    }
}
