//
//  DateConvertorFomrat.swift
//  NewsApp
//
//  Created by Leslie on 16/07/2022.
//

import Foundation
import UIKit

//2022-07-16T10:01:00Z

extension String {
    func stringToDate(with format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ")->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {return Date()}
        return date
    }
}

