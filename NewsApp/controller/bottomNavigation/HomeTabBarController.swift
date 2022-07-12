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
        let navigationController = UINavigationController(rootViewController: NewsViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        
        
        let newsScreen = navigationController
        newsScreen.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 0)
        
        let secondScreen = DetailsViewController()
        secondScreen.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "heart"), tag: 1)
        
        viewControllers =  [newsScreen, secondScreen]
        
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
