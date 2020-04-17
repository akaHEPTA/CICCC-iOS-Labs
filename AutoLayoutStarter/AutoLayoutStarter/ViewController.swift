//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let purpleBoxView: UIView = {
        let pBoxView = UIView.init(frame: CGRect.zero)
        pBoxView.translatesAutoresizingMaskIntoConstraints = false
        pBoxView.backgroundColor = .purple
        return pBoxView
    }()
    
    let blueBoxesView: UIView = {
        let bStackView = UIStackView()
        bStackView.translatesAutoresizingMaskIntoConstraints = false
        bStackView.axis = .vertical
        bStackView.distribution = .equalSpacing
        
        let bBoxView1 = UIView.init(frame: CGRect.zero)
        bBoxView1.translatesAutoresizingMaskIntoConstraints = false
        bBoxView1.backgroundColor = .blue
        NSLayoutConstraint.activate([
            bBoxView1.widthAnchor.constraint(equalToConstant: 70),
            bBoxView1.heightAnchor.constraint(equalToConstant: 70)
        ])
        bStackView.addArrangedSubview(bBoxView1)
        
        let bBoxView2 = UIView.init(frame: CGRect.zero)
        bBoxView2.translatesAutoresizingMaskIntoConstraints = false
        bBoxView2.backgroundColor = .blue
        NSLayoutConstraint.activate([
            bBoxView2.widthAnchor.constraint(equalToConstant: 70),
            bBoxView2.heightAnchor.constraint(equalToConstant: 70)
        ])
        bStackView.addArrangedSubview(bBoxView2)
        
        let bBoxView3 = UIView.init(frame: CGRect.zero)
        bBoxView3.translatesAutoresizingMaskIntoConstraints = false
        bBoxView3.backgroundColor = .blue
        NSLayoutConstraint.activate([
            bBoxView3.widthAnchor.constraint(equalToConstant: 70),
            bBoxView3.heightAnchor.constraint(equalToConstant: 70)
        ])
        bStackView.addArrangedSubview(bBoxView3)
        
        return bStackView
    }()
    
    let orangeBoxesView: UIView = {
        let rBoxBGView = UIView.init(frame: CGRect.zero)
        rBoxBGView.translatesAutoresizingMaskIntoConstraints = false
        rBoxBGView.backgroundColor = .red
        
        let rStackView = UIStackView()
        rStackView.translatesAutoresizingMaskIntoConstraints = false
        rStackView.axis = .horizontal
        rStackView.spacing = 10
        rBoxBGView.addSubview(rStackView)

        let rBoxView1 = UIView.init(frame: CGRect.zero)
        rBoxView1.translatesAutoresizingMaskIntoConstraints = false
        rBoxView1.backgroundColor = .orange
        rStackView.addArrangedSubview(rBoxView1)
        
        let rBoxView2 = UIView.init(frame: CGRect.zero)
        rBoxView2.translatesAutoresizingMaskIntoConstraints = false
        rBoxView2.backgroundColor = .orange
        rStackView.addArrangedSubview(rBoxView2)
        
        NSLayoutConstraint.activate([
            rBoxBGView.widthAnchor.constraint(equalToConstant: 240),
            rBoxBGView.heightAnchor.constraint(equalToConstant: 70),
            
            rStackView.widthAnchor.constraint(equalToConstant: 220),
            rStackView.heightAnchor.constraint(equalToConstant: 50),
            rStackView.centerXAnchor.constraint(equalTo: rBoxBGView.centerXAnchor),
            rStackView.centerYAnchor.constraint(equalTo: rBoxBGView.centerYAnchor),
            
            rBoxView1.widthAnchor.constraint(equalToConstant: 115),
            rBoxView1.heightAnchor.constraint(equalToConstant: 50),
            
            rBoxView2.widthAnchor.constraint(equalToConstant: 95),
            rBoxView2.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return rBoxBGView
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        mainView.addSubview(purpleBoxView)
        NSLayoutConstraint.activate([
            purpleBoxView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
            purpleBoxView.heightAnchor.constraint(equalToConstant: 70),
            purpleBoxView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -30),
            purpleBoxView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30)
        ])
        
        mainView.addSubview(blueBoxesView)
        NSLayoutConstraint.activate([
            blueBoxesView.widthAnchor.constraint(equalToConstant: 70),
            blueBoxesView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.66),
            blueBoxesView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            blueBoxesView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
        ])
        
        mainView.addSubview(orangeBoxesView)
        NSLayoutConstraint.activate([
            orangeBoxesView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30),
            orangeBoxesView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -30)
        ])
        
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

