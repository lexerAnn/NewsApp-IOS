//
//  HomeTabBarController.swift
//  NewsApp
//
//  Created by Leslie on 09/07/2022.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupTabs()
        
        // Do any additional setup after loading the view.
    }
    
    func setupTabs(){
        let navigationController1 = UINavigationController(rootViewController: NewsViewController())
        let navigationController2 = UINavigationController(rootViewController: FavoriteViewController())

        navigationController1.navigationBar.prefersLargeTitles = true
        navigationController2.navigationBar.prefersLargeTitles = true
        
        navigationController1.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 0)
        navigationController2.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)

        viewControllers =  [navigationController1, navigationController2]
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
