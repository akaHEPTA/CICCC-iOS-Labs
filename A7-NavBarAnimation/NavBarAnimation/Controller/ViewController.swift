//
//  ViewController.swift
//  NavbarAnimation
//
//  Created by Richard Cho on 2020-05-14.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Identifier {
        static let snackCell = "SnackTableViewCell"
    }
    
    private let hasNotch = UIDevice.current.hasNotch
    private var isOpened = false
    
    private let images = ["oreos", "pizza_pockets", "pop_tarts", "popsicle", "ramen"]
    
    private var snacks: [Snack] = [.oreo, .pizza_pocket, .pop_tart, .popsicle, .ramen]
    
    let navBar: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(hex: "#DDDDDD")
        return v
    }()
    
    let navBarTitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "SNACKS"
        lb.font = .systemFont(ofSize: 17, weight: .bold)
        return lb
    }()
    
    let navBarButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("＋", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        btn.titleLabel?.textColor = .blue
        btn.addTarget(self, action: #selector(plusButtonTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var imageViews = images.map{ getUIImageView(from: $0) }
    
    let imageStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.isHidden = true
        return sv
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private var navBarFold: NSLayoutConstraint!
    private var navBarUnfold: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navBar)
        view.addSubview(tableView)
        navBar.addSubview(navBarTitleLabel)
        navBar.addSubview(navBarButton)
        navBar.addSubview(imageStackView)
        imageViews.forEach{ imageStackView.addArrangedSubview($0) }
        
        navBarFold = navBar.heightAnchor.constraint(equalToConstant: hasNotch ? NavBarSizes.NAVIGATION_BAR_FOLD_WITH_NOTCH : NavBarSizes.STATUS_BAR_WITHOUT_NOTCH + NavBarSizes.NAVIGATION_BAR_FOLD_WITHOUT_NOTCH)
        navBarUnfold = navBar.heightAnchor.constraint(equalToConstant: NavBarSizes.NAVIGATION_BAR_UNFOLD)

        navBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navBarFold.isActive = true
        
        navBarTitleLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
        navBarTitleLabel.topAnchor.constraint(equalTo: navBar.topAnchor, constant: hasNotch ? 50 : 30).isActive = true
        
        navBarButton.centerYAnchor.constraint(equalTo: navBarTitleLabel.centerYAnchor).isActive = true
        navBarButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -8).isActive = true
        
        imageStackView.topAnchor.constraint(equalTo: navBar.topAnchor, constant: 88).isActive = true
        imageStackView.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 20).isActive = true
        imageStackView.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -20).isActive = true
        imageStackView.bottomAnchor.constraint(equalTo:navBar.bottomAnchor, constant: -20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifier.snackCell)
        tableView.reloadData()
    }
    
    @objc func plusButtonTapped(_ sender: UIButton) {
        isOpened.toggle()
        
        if isOpened {
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 20, animations: {
                self.navBarFold.isActive = false
                self.navBarUnfold.isActive = true
                self.navBarTitleLabel.text = "Add a SNACK"
                self.navBarButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                self.imageStackView.isHidden = false
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 20, animations: {
                self.navBarUnfold.isActive = false
                self.navBarFold.isActive = true
                self.navBarTitleLabel.text = "SNACKS"
                self.navBarButton.transform = .identity
                self.imageStackView.isHidden = true
                self.view.layoutIfNeeded()
            })
        }
    }
    
    private func getUIImageView(from string: String) -> UIImageView {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: string)
        iv.contentMode = .scaleAspectFit
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.addSnack(_:))))
        return iv
    }
    
    @objc func addSnack(_ sender: UITapGestureRecognizer) {
        switch sender.view {
        case imageViews[0]:
            snacks.insert(Snack.oreo, at: 0)
        case imageViews[1]:
            snacks.insert(Snack.pizza_pocket, at: 0)
        case imageViews[2]:
            snacks.insert(Snack.pop_tart, at: 0)
        case imageViews[3]:
            snacks.insert(Snack.popsicle, at: 0)
        case imageViews[4]:
            snacks.insert(Snack.ramen, at: 0)
        default:
            return
        }
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snacks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.snackCell, for: indexPath)
        cell.textLabel?.text = snacks[indexPath.row].rawValue
        return cell
    }
    
}
