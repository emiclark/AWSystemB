//
//  FeedMainCollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/10/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit

class FeedMainCollectionViewCell: UICollectionViewCell {

    lazy var thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "channelDragonPlaceholder.png")
        return iv
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.darkGray
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.darkGray
        return label
    }()

    lazy var stackview: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [thumbnailImageView, titleLabel, subtitleLabel])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 3
        return sv
    }()

    func setupView() {
        addSubview(stackview)

        stackview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configure(with snippet: Snippet) {
        titleLabel.text = snippet.title
        subtitleLabel.text = snippet.description
    }
}
