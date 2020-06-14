//
//  RepoListDetailCell.swift
//  StarsTop
//
//  Created by Samuel Furtado on 13/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import UIKit

final class RepoListDetailCell: UITableViewCell {
    
    lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        return imageView
    }()
    
    lazy var repoName: UILabel = {
        let label = UILabel()
        //label.text =
        
        return label
    }()
    
    lazy var starsNumber: UILabel = {
        let label = UILabel()
        //label.text =
        
        return label
    }()
    
    lazy var authorName: UILabel = {
        let label = UILabel()
        //label.text =
        
        return label
    }()
    
    lazy var stackViewPhoto: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.photo])
        stackView.distribution = .fill
        stackView.axis = .vertical
        
        return stackView
    }()
    
    lazy var stackViewInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.repoName, self.starsNumber, self.authorName])
        stackView.distribution = .fill
        stackView.axis = .vertical
        
        return stackView
    }()
    
    lazy var stackViewBackground: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.stackViewPhoto, self.stackViewInfo])
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    internal func setup(with viewModel: RepositoryViewModel) {
        //self.photo.image = viewModel.photo
        repoName.text = viewModel.name
        starsNumber.text = String(viewModel.stars)
        authorName.text = viewModel.author
    }
    
    private func setupUI() {
        self.addSubview(stackViewBackground)
        setupStackviewBackgroundConstraints()
    }
    
    private func setupStackviewBackgroundConstraints() {
        stackViewBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           stackViewBackground.leftAnchor.constraint(equalTo: self.leftAnchor),
           stackViewBackground.rightAnchor.constraint(equalTo: self.rightAnchor),
           stackViewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
           stackViewBackground.topAnchor.constraint(equalTo: self.topAnchor),
            ])
    }
}
