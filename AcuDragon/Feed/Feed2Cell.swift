//
//  Feed2Cell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/22/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class Feed2Cell: UICollectionViewCell {

    public static let cellId = "cell2"

    lazy var thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
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
        label.numberOfLines = 0
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
            make.leading.top.trailing.equalToSuperview()
        }

        thumbnailImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(5)
            make.size.equalTo(45)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.top.equalTo(stackview).offset(5)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
    }

    func configure(with video: Snippet?, for section: Int) {
        guard let video = video else { return }

        thumbnailImageView.image = UIImage(named: "dragonRed.png")
        titleLabel.text = video.title
        subtitleLabel.text = video.description
    }
}

