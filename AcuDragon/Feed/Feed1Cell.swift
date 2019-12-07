//
//  Feed0\1Cell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 12/04/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class Feed1Cell: UICollectionViewCell {

    public static let cellId = "cell1"

    lazy var thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
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
            make.leading.equalToSuperview().offset(3)
            make.trailing.equalToSuperview().offset(-3)
        }
    }

    func configure(with video: Snippet?) {
        guard let video = video else { return }
        titleLabel.text = video.title
    }
}
