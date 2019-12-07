//
//  Feed0Cell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/21/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class Feed0Cell: UICollectionViewCell {

    public static let cellId = "cell0"

    lazy var thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "channelDragonPlaceholder.png")
        return iv
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.darkGray
        return label
    }()

    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
    }

    required init?(coder: NSCoder) {
       super.init(coder: coder)
    }

    func setupView() {
        addSubview(thumbnailImageView)
        addSubview(titleLabel)

        thumbnailImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp.bottom).offset(3)
            make.leading.trailing.equalToSuperview()
        }
    }

    func configure(with video: Snippet?) {
        guard let video = video else { return }
        titleLabel.text = video.title
    }
}


//===
//    lazy var thumbnailImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "channelDragonPlaceholder.png")
////        iv.layer.cornerRadius = 10
////        iv.layer.masksToBounds = true
////        iv.frame = CGRect(x: 0, y: 0, width: 250, height: 240)
////        iv.clipsToBounds = true
//        return iv
//    }()
