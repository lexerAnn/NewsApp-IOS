//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Leslie on 12/07/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    var newsImageView = UIImageView()
    var newsTitleView = UILabel()
    var moreOptionsView = UIButton(type: .system)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(newsImageView)
        addSubview(newsTitleView)
        addSubview(moreOptionsView)
        configureImageView()
        configureTitleView()
//        configureMoreOtionBtn()
        setupImageViewConstraints()
        setupTitleViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView(){
        newsImageView.layer.cornerRadius = 20
        newsImageView.clipsToBounds = true
    }
    func configureTitleView(){
        newsTitleView.numberOfLines = 2
        newsTitleView.adjustsFontSizeToFitWidth = false
        newsTitleView.font = UIFont.systemFont(ofSize: 16)
    }
    func configureMoreOtionBtn(){
        moreOptionsView.isUserInteractionEnabled = true
        moreOptionsView.tintColor = UIColor.black
        moreOptionsView.setImage(UIImage(systemName: "ellipsis"), for: .normal)
    }
    
    func setupImageViewConstraints(){
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        newsImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    func setupTitleViewConstraints() {
        newsTitleView.translatesAutoresizingMaskIntoConstraints = false
        newsTitleView.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 20).isActive = true
        newsTitleView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        newsTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
//    func setupMoreOptionIconConstraints(){
//        moreOptionsView.translatesAutoresizingMaskIntoConstraints = false
//        moreOptionsView.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -24).isActive = true
//        moreOptionsView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
//    }
    
    func setNewsCell(news: Article){
        newsTitleView.text =  news.title
        newsImageView.load(url: news.urlToImage ?? "")
        
    }
    func setSavedNewsCell(news: NewsModelObject){
        newsTitleView.text =  news.title
        newsImageView.load(url: news.urlToImage ?? "")
    }

}
