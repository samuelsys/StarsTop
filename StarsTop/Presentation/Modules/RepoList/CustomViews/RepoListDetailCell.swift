//
//  RepoListDetailCell.swift
//  StarsTop
//
//  Created by Samuel Furtado on 13/06/20.
//  Copyright © 2020 Test. All rights reserved.
//

import Kingfisher
import UIKit

final class RepoListDetailCell: UITableViewCell {
    
    private var photoImageView = UIImageView()
    private var repoNameLabel = UILabel()
    private var starsNumberLabel = UILabel()
    private var authorNameLabel = UILabel()
    
    lazy var stackViewInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.repoNameLabel, self.starsNumberLabel, self.authorNameLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var stackViewBackground: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.photoImageView, self.stackViewInfo])
        stackView.distribution = .fill
        stackView.spacing = 20.0
        stackView.axis = .horizontal
        return stackView
    }()
    
    internal func setup(with viewModel: RepositoryViewModel) {
        
        setupUI()
        
        photoImageView.kf.setImage(with: URL(string: viewModel.photo))
        repoNameLabel.text = viewModel.name
        starsNumberLabel.text = String(viewModel.stars)
        authorNameLabel.text = viewModel.author
    }
    
    private func setupUI() {
        addSubview(stackViewBackground)
        backgroundColor = UIColor.systemGray5
        setupStackviewBackgroundConstraints()
        setupPhotoConstraints()
    }
    
    private func setupStackviewBackgroundConstraints() {
        stackViewBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewBackground.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10.0),
            stackViewBackground.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10.0),
            stackViewBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            stackViewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupPhotoConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: 80.0)
        ])
    }
}
