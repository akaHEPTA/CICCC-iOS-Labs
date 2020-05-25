//
//  ViewController.swift
//  MyRestaurants
//
//  Created by Richard Cho on 2020-05-24.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var restaurants: [Restaurant] = Restaurant.getAll
    private var filteredRestaurants: [Restaurant] = []
    
    let filterCollectionView: UICollectionView = {
        let lt = UICollectionViewFlowLayout()
        lt.scrollDirection = .horizontal
        lt.minimumInteritemSpacing = 10
        lt.minimumLineSpacing = 10
        lt.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lt)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .grayBackground
        return cv
    }()
    
    var restaurantCollectionView: UICollectionView = {
        let lt = UICollectionViewFlowLayout()
        lt.scrollDirection = .vertical
        lt.minimumInteritemSpacing = 10
        lt.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: lt)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .grayBackground
        return cv
    }()
    
    let typeOfFood = Restaurant.TypeOfFood.allCases.map { $0.rawValue }
    let mealTime = Restaurant.MealTime.allCases.map { $0.rawValue }
    
    lazy var filterOptions = typeOfFood + mealTime
    //["American", "Chinese", "Greek", "Indian", "Italian", "Japanese", "Korean", "Mexican", "MiddleEstern", "Taiwanese", "Vietnamese"]
    private lazy var typeFilter: [Restaurant.TypeOfFood] = [] // = [Bool](repeating: false, count: self.typeOfFood.count)
    private lazy var timeFilter: [Restaurant.MealTime] = [] // = [Bool](repeating: false, count: self.mealTime.count)
    
    private lazy var filterData = [Bool](repeating: false, count: self.filterOptions.count)
    
    var isFiltering : Bool {
        return !typeFilter.isEmpty || !timeFilter.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
        view.backgroundColor = .grayBackground
        view.addSubview(filterCollectionView)
        view.addSubview(restaurantCollectionView)
        
        setupCollectionViews()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = .skyblueTint
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "My Restaurants"
        
    }
    
    private func setupCollectionViews() {
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.filterCollectionViewCell)
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        
        restaurantCollectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.restaurantCollectionViewCell)
        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
    }
    
    private func setupConstraints() {
        filterCollectionView.anchors(
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor,
            trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor,
            bottomAnchor: nil
        )
        filterCollectionView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        restaurantCollectionView.anchors(
            topAnchor: filterCollectionView.bottomAnchor,
            leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor,
            trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor,
            bottomAnchor: view.bottomAnchor
        )
    }
    
    private func filterRestaurantFor(typeOfFood: [Restaurant.TypeOfFood?], mealTime: [Restaurant.MealTime?]) {
        filteredRestaurants = restaurants.filter { (restaurant) in
            return (typeOfFood.contains(restaurant.typeOfFood) || mealTime.contains(restaurant.mealTime))
        }
        restaurantCollectionView.reloadData()
    }
    
}

// MARK: - Collection View Data Source
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.filterCollectionView {
            return filterOptions.count
        } else {
            return isFiltering ? filteredRestaurants.count : restaurants.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.filterCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.filterCollectionViewCell, for: indexPath) as! FilterCollectionViewCell
            cell.label.text = filterOptions[indexPath.row]
            cell.isFiltering = filterData[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier.restaurantCollectionViewCell, for: indexPath) as! RestaurantCollectionViewCell
            let restaurant = isFiltering ? filteredRestaurants[indexPath.row] : restaurants[indexPath.row]
            cell.imageView.image = UIImage(named: restaurant.image)
            cell.nameLabel.text = restaurant.name
            cell.detailLabel.text = "\(restaurant.typeOfFood.rawValue) - \(restaurant.mealTime.rawValue)"
            return cell
        }
    }
    
}

// MARK: - Collection View Delegate
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.filterCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! FilterCollectionViewCell
            filterData[indexPath.row].toggle()
            cell.isFiltering = filterData[indexPath.row]
            cell.changeColor()
            
            if indexPath.row < typeOfFood.count {
                let type = Restaurant.TypeOfFood.init(rawValue: cell.label.text!)!
                if filterData[indexPath.row] { typeFilter.append(type) }
                else { typeFilter.remove(at: typeFilter.firstIndex(of: type)!) }
            } else {
                let time = Restaurant.MealTime.init(rawValue: cell.label.text!)!
                if filterData[indexPath.row] { timeFilter.append(time) }
                else { timeFilter.remove(at: timeFilter.firstIndex(of: time)!) }
            }
            filterRestaurantFor(typeOfFood: typeFilter, mealTime: timeFilter)
        }
        return
    }
}

// MARK: - Collection View Delegate Flow Layout
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.filterCollectionView {
            return .zero
        } else {
            let width = (collectionView.frame.width - 30) / 2
            let height = width + 34
            return CGSize(width: width, height: height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.filterCollectionView {
            return .init(top: 10, left: 10, bottom:  10, right: 10)
        } else {
            return .init(top: 0, left: 10, bottom: 0, right: 10)
        }
        
    }
    
}
