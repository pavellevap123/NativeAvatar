//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Pavel Paddubotski on 22.05.23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .systemGray
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        layout()
    }
    
    private func layout() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCustomImage()
    }
    
    func setupCustomImage() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        guard let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        
        navigationBar.subviews.forEach { subview in
            if subview.isKind(of: UINavigationBarLargeTitleView.self) {
                subview.addSubview(imageView)
                
                NSLayoutConstraint.activate([
                    imageView.bottomAnchor.constraint(
                        equalTo: subview.bottomAnchor,
                        constant: -8
                    ),
                    imageView.trailingAnchor.constraint(
                        equalTo: subview.trailingAnchor,
                        constant: -view.directionalLayoutMargins.trailing
                    ),
                    imageView.heightAnchor.constraint(equalToConstant: 36),
                    imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
                ])
            }
        }
    }
}
