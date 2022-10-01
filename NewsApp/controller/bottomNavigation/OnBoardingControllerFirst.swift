//
//  OnBoardingControllerFirst.swift
//  NewsApp
//
//  Created by Leslie on 30/09/2022.
//

import Foundation
import UIKit
class OnBoardingControllerFirst: UIViewController {
    
    var imageView = UIImageView()
    var descriptionText = UITextView()
    var previousBtn = UIButton(type: .system)
    var nextBtn = UIButton(type: .system)
    var pageControl = UIPageControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage()
        constraintImage()

        setupDescritptionTextView()
        constraintDescritptionTextView()
        setupNextBtn()
        setupPreviousBtn()
        setupPageController()
        setupWithConstraintBottomStackControls()
       
    }
    
    func setupDescritptionTextView() {
        view.addSubview(descriptionText)
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun games", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSMutableAttributedString(string: "\nAre you ready for leads in affiliate marketting today?", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSMutableAttributedString.Key.foregroundColor: UIColor.gray]))
        descriptionText.attributedText = attributedText
        descriptionText.font = UIFont.boldSystemFont(ofSize: 18)
        descriptionText.textAlignment = .center
        descriptionText.translatesAutoresizingMaskIntoConstraints = false

    }
    func constraintDescritptionTextView(){
        NSLayoutConstraint.activate([
            descriptionText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 70),
            descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54),
            descriptionText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10)
        ])
    }
    
    func setupImage(){
        view.addSubview(imageView)
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

    }
    func constraintImage(){
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    //        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    
    }
    func setupPreviousBtn(){
        view.addSubview(previousBtn)
        previousBtn.setTitle("Previous", for: .normal)
        previousBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        previousBtn.setTitleColor(.gray, for: .normal)
        previousBtn.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupNextBtn(){
        view.addSubview(previousBtn)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.setTitleColor(.gray, for: .normal)
        nextBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupPageController(){
        view.addSubview(pageControl)
        pageControl.currentPage = 0
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .gray
        pageControl.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func setupWithConstraintBottomStackControls(){
        let greenView = UIView()
        greenView.backgroundColor = .green
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousBtn,pageControl,nextBtn])
        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
//bottomControlsStackView.backgroundColor = UIColor.red

        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant : 50)
            //bottomControlsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])

            
    }

    
}
