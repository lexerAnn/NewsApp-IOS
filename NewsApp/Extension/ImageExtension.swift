//
//  ImageExtension.swift
//  NewsApp
//
//  Created by Leslie on 13/07/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: String){
        guard let urlValid = URL(string: url) else {
            return
        }
        DispatchQueue.global().async {[weak self] in
            if let data  = try? Data(contentsOf :urlValid){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
                
            }
        }
    }
}


