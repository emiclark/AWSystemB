//
//  FeedSection2CollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/22/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class FeedSection2CollectionViewCell: UICollectionViewCell {

    lazy var thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "channelDragonPlaceholder.png")
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        return iv
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.darkGray
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 3
        label.textAlignment = .left
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.darkGray
        return label
    }()

    lazy var stackview: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [thumbnailImageView, titleLabel])
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        sv.alignment = .bottom
        sv.spacing = 5
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
        addSubview(subtitleLabel)
        addSubview(stackview)

        stackview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(3)
            make.trailing.equalToSuperview().offset(-3)
            make.top.equalToSuperview().offset(5)
        }

        thumbnailImageView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.top.equalTo(stackview.snp.bottom).offset(5)
        }
    }

    func configure(with video: Snippet?) {
        guard let video = video else { return }
        titleLabel.text = video.title
        subtitleLabel.text = video.description
    }
}

