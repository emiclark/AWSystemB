//
//  Feed1CollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/17/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit

class Feed1CollectionViewCell: UICollectionViewCell {

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
        label.text = "Title"
        label.textColor = UIColor.darkGray
        return label
    }()
//
//    lazy var subtitleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16.0)
//        label.lineBreakMode = .byWordWrapping
//        label.numberOfLines = 0
//        label.text = "subTitle"
//        label.backgroundColor = UIColor.white
//        label.textColor = UIColor.darkGray
//        return label
//    }()

    lazy var stackview: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [thumbnailImageView, titleLabel])
        sv.axis = .vertical
        sv.distribution = .fillProportionally
        sv.spacing = 3
        return sv
    }()

    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
    }

    required init?(coder: NSCoder) {
       super.init(coder: coder)
    }

    func setupView() {
        addSubview(stackview)

        stackview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        thumbnailImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(120)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }

//    func configure(with video: Snippet) {
//        titleLabel.text = "Vide Title I7nbFXul"
//        subtitleLabel.text = "Vide Description. I7nbFXul YBIpL0a yR_gDh3e u1k/4u2y EcJX6qW4oAcx k02qmVTvX4"
//
//        titleLabel.text = video.title
//        subtitleLabel.text = video.description
//    }
}
