//
//  NewsModelObject.swift
//  NewsApp
//
//  Created by Leslie on 30/07/2022.
//

import Foundation
import RealmSwift

class NewsModelObject: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var author: String?
    @Persisted var title: String?
    @Persisted var descriptions: String?
    @Persisted var url: String?
    @Persisted var urlToImage: String?
    @Persisted var publishedAt: String?
    @Persisted var content: String?
    
    convenience  init(id: String, author:String?, title:String?, descriptions:String? ,url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.init()
        self.id = id
        self.author = author
        self.title = title
        self.descriptions = descriptions
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content

    }
}
