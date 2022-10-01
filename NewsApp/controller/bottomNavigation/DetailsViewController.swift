//
//  DetailsViewController.swift
//  NewsApp
//
//  Created by Leslie on 09/07/2022.
//

import UIKit
import RealmSwift

class DetailsViewController: UIViewController {
    
    
    var passedData: Article?
    var newsImage = UIImageView()
    var newsContent =  UILabel()
    var newsTitle = UILabel()
    var newsArthurLogo = UIImageView()
    var newsArthur = UILabel()
    var newsDate = UILabel()
    var scrollView = UIScrollView()



    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewsTitle()
        setupNewsImage()
        setupNewsArthurLogo()
        setupNewsArthur()
        setupNewsDate()
//      setupSrollView()
        setupContent()
        setupNewsTitleConstraints()
        setuoNewsConstraints()
        setupNewsArthurConstraints()
        setupNewsArthurLogoConstraints()
        setupNewsDateConstraints()
//       setupScrollViewConstraint()
        setupContentConstraints()
        
        
        let addItem =  UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewToDB))
        self.navigationItem.rightBarButtonItem = addItem
        
    }
    
    @objc func saveNewToDB(){
        let realm = try! Realm()
        
        let savedNews = NewsModelObject(id: UUID().uuidString, author: passedData?.author, title: passedData?.title, descriptions: passedData?.description,url: passedData?.url, urlToImage: passedData?.urlToImage, publishedAt: passedData?.publishedAt, content: passedData?.content)
        do{
            try realm.write{
                realm.add(savedNews)
         }
            let alert = UIAlertController(title: "News Saved!", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            
        } catch (let error) {
            let alert = UIAlertController(title: "Try Again", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
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
        newsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        newsTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        //newsTitle.heightAnchor.constraint(equalToConstant: 220).isActive = true
        newsTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func setuoNewsConstraints(){
        newsImage.clipsToBounds = true
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 20).isActive = true
        newsImage.leadingAnchor.constraint(equalTo: newsTitle.leadingAnchor, constant: 0).isActive = true
        newsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
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
    
//    func setupSrollView(){
//        view.addSubview(scrollView)
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//    }
    
//    func setupScrollViewConstraint(){
//        scrollView.topAnchor.constraint(equalTo: newsArthur.bottomAnchor, constant: 20).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: newsArthur.leadingAnchor, constant: 20).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 20).isActive = true
//        //scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }
    
    func setupNewsArthurConstraints(){
        newsArthur.translatesAutoresizingMaskIntoConstraints = false
        newsArthur.topAnchor.constraint(equalTo: newsArthurLogo.topAnchor, constant: 0).isActive = true
        newsArthur.leadingAnchor.constraint(equalTo: newsArthurLogo.leadingAnchor, constant: 26).isActive = true
    }
    
    func setupNewsDate(){
        view.addSubview(newsDate)
    
        //let date =  passedData?.publishedAt.stringToDate()
        newsDate.text =  passedData?.publishedAt
        //dateFormatter(dateString: (passedData!.publishedAt))
        newsDate.font = UIFont.systemFont(ofSize: 16)
    }
    
    func setupNewsDateConstraints(){
        newsDate.translatesAutoresizingMaskIntoConstraints = false
        newsDate.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10).isActive = true
        newsDate.trailingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 0).isActive = true
    }
    
    func setupContent(){
        view.addSubview(newsContent)
        newsContent.text = passedData?.description
//        newsContent.isScrollEnabled = true
        newsContent.numberOfLines = 0
        //newsContent.sizeToFit()
    }
    func setupContentConstraints(){
        newsContent.translatesAutoresizingMaskIntoConstraints = false
        newsContent.topAnchor.constraint(equalTo: newsArthur.bottomAnchor, constant: 32).isActive = true
        newsContent.leadingAnchor.constraint(equalTo: newsImage.leadingAnchor, constant: 0).isActive = true
        newsContent.trailingAnchor.constraint(equalTo: newsDate.trailingAnchor, constant: 0).isActive = true
        //newsContent.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //newsContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
    }

}
extension DetailsViewController: SelectedNewsDelegate{
    func choosenNews(article: Article) {
        print("selected News\(article.urlToImage)")
    }
}
