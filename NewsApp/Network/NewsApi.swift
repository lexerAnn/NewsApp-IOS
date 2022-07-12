//
//  NewsApi.swift
//  NewsApp
//
//  Created by Leslie on 09/07/2022.
//

import Foundation

enum ApiErros: Error {
    case NoDataAvailiable
    case CanNotProcessData
    case CanNotProcessDataJSON
    case invalidURL
}


struct Networking{
    static let sharedInstanceNetworking = Networking()
    
    let session = URLSession.shared
    
    func getNews<T: Decodable>(urlString: String, expecting: T.Type, completion: @escaping(Result<T, ApiErros>) -> Void){
        guard let urlString = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: urlString)
       
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.CanNotProcessData))
                return
            }
            guard let data = data else {
                completion(.failure(.NoDataAvailiable))
                return
            }
           // print(data)
            
            do{
                let decoder = JSONDecoder()
                let dataResponse = try decoder.decode(expecting, from: data)
                completion(.success(dataResponse))
                
            } catch (let error){
                completion(.failure(.invalidURL))
                print(error.localizedDescription)
            }
        }.resume()
        
    }    
}
