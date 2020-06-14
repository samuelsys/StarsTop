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
    
    struct Constants {
        static let initNotImpementedError = "init(coder:) has not been implemented"
        
        struct StackViewBackground {
            static let margin: CGFloat = 10.0
            static let cellIdentifier = "Cell"
        }
        
        struct PhotoImageView {
            static let height: CGFloat = 80.0
        }
    }
    
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
        setupStackviewBackground()
        setupPhotoImageView()
    }
    
    private func setupStackviewBackground() {
        stackViewBackground.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewBackground.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                      constant: Constants.StackViewBackground.margin),
            stackViewBackground.rightAnchor.constraint(equalTo: self.rightAnchor,
                                                       constant: Constants.StackViewBackground.margin),
            stackViewBackground.topAnchor.constraint(equalTo: self.topAnchor,
                                                     constant: Constants.StackViewBackground.margin),
            stackViewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupPhotoImageView() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: Constants.PhotoImageView.height)
        ])
    }
}
