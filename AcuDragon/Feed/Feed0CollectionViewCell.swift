//
//  Feed0CollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/17/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class Feed0CollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let feedModel = FeedModel()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Constants.awsGray1
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
       super.init(coder: coder)
    }

    func setupView() {
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FeedSection0CollectionViewCell.self, forCellWithReuseIdentifier: "section0CellId")
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return FeedModel.feedVideos.items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "section0CellId", for: indexPath) as! FeedSection0CollectionViewCell
        let video = FeedModel.feedVideos.items?[indexPath.row].snippet
        cell.configure(with: video)
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.clipsToBounds = true
        cell.backgroundColor = Constants.awsGray1

        cell.thumbnailImageView.sd_setShowActivityIndicatorView(true)
        cell.thumbnailImageView.sd_setIndicatorStyle(.whiteLarge)
        let imageUrl = URL(string: (video?.thumbnails?.medium?.url ?? ""))
        if imageUrl != nil {
            cell.thumbnailImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named:  "dragonPlaceholder.jpg"), options: .highPriority, completed: nil)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = width * 9 / 16
        VideoCell.videoHeight = height
        return CGSize(width: (width * 0.70) - 20, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 5)
    }
}

//class FeedSection0CollectionViewCell: UICollectionViewCell {
//
//    lazy var thumbnailImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFill
//        iv.image = UIImage(named: "channelDragonPlaceholder.png")
//        return iv
//    }()
//
//    lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 18.0)
//        label.lineBreakMode = .byWordWrapping
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.backgroundColor = UIColor.white
//        label.textColor = UIColor.darkGray
//        return label
//    }()
//
//    lazy var stackview: UIStackView = {
//        let sv = UIStackView(arrangedSubviews: [thumbnailImageView, titleLabel])
//        sv.axis = .vertical
//        sv.distribution = .fillProportionally
//        sv.alignment = .center
//        sv.spacing = 2
//        return sv
//    }()
//
//    override init(frame: CGRect) {
//           super.init(frame: frame)
//           setupView()
//    }
//
//    required init?(coder: NSCoder) {
//       super.init(coder: coder)
//    }
//
//    func setupView() {
//        addSubview(stackview)
//        stackview.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        thumbnailImageView.snp.makeConstraints { make in
//            make.leading.top.trailing.equalToSuperview()
//            make.height.equalTo(160)
//        }
//
//        titleLabel.snp.makeConstraints { make in
//            make.leading.trailing.bottom.equalToSuperview()
//        }
//    }
//
//    func configure(with video: Snippet?) {
//        guard let video = video else { return }
//        titleLabel.text = video.title
//    }
//}
