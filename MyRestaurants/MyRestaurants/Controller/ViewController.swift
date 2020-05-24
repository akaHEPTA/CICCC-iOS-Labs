//
//  ViewController.swift
//  MyRestaurants
//
//  Created by Richard Cho on 2020-05-24.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let filterCollectionView: UICollectionView = {
        let lt = UICollectionViewFlowLayout()
        lt.scrollDirection = .horizontal
        lt.minimumInteritemSpacing = 10
        lt.minimumLineSpacing = 10
        lt.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lt)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(hex: "#E2E1E1")
        return cv
    }()
    
    var restaurantCollectionView: UICollectionView = {
        let lt = UICollectionViewFlowLayout()
        lt.scrollDirection = .vertical
        lt.minimumInteritemSpacing = 10
        lt.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lt)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor(hex: "#E2E1E1")
        return cv
    }()
    
    let typeOfFood = Restaurant.TypeOfFood.allCases.map { $0.rawValue }
    let mealTime = Restaurant.MealTime.allCases.map { $0.rawValue }
    
    lazy var filterOptions = typeOfFood + mealTime
    //["American", "Chinese", "Greek", "Indian", "Italian", "Japanese", "Korean", "Mexican", "MiddleEstern", "Taiwanese", "Vietnamese"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(hex: "#5085D7FF")
        navigationController?.title = "My Restaurants"
        
        view.backgroundColor = UIColor(hex: "#E2E1E1")
        view.addSubview(filterCollectionView)
        view.addSubview(restaurantCollectionView)
        
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.filterCollectionViewCell)
        restaurantCollectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.restaurantCollectionViewCell)
        
        filterCollectionView.dataSource = self
        restaurantCollectionView.dataSource = self
        
        filterCollectionView.delegate = self
        restaurantCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 54),
            
            restaurantCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor),
            restaurantCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            restaurantCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            restaurantCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.filterCollectionView {
            return filterOptions.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.filterCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.filterCollectionViewCell, for: indexPath) as! FilterCollectionViewCell
            cell.backgroundColor = .white
            cell.label.text = filterOptions[indexPath.row]
            cell.label.textColor = UIColor(hex: "#5085D7")
            cell.layer.cornerRadius = 5.0
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.restaurantCollectionViewCell, for: indexPath) as! RestaurantCollectionViewCell
            // set up
            return cell
        }
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == self.filterCollectionView {
//            let width = 50
//            return CGSize(width: width, height: 44)
//        } else {
//            let width = (collectionView.frame.width - 30) / 2
//            let height = (collectionView.frame.height - 50) / 3
//            return CGSize(width: width, height: height)
//        }
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.filterCollectionView {
            return .init(top: 10, left: 10, bottom:  0, right: 10)
        }
        return .zero
    }
}
