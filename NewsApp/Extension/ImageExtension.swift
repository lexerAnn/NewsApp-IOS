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
        guard let imageURL = URL(string: url) else { return }

              // just not to cause a deadlock in UI!
          DispatchQueue.global().async {
              guard let imageData = try? Data(contentsOf: imageURL) else { return }

              let image = UIImage(data: imageData)
              DispatchQueue.main.async {
                  self.image = image
              }
          }
    }
}


