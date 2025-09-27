//
//  UIViewController+Extension.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 05/08/25.
//

import UIKit

extension UIViewController {
    func headerWithProfilePicture(width: CGFloat) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 8
        
        let helloLabel = UILabel()
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.numberOfLines = 2
        helloLabel.text = "Hello, \nIrfanul Arifa"
        helloLabel.font = .systemFont(ofSize: 14)
        helloLabel.textColor = UIColor.white
        
        containerView.addSubview(imageView)
        containerView.addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 32),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4),
            
            helloLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4),
            helloLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4)
        ])
        
        return containerView
    }
}
