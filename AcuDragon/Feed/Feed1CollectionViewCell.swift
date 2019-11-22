//
//  Feed1CollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/21/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage


class Feed1CollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

     let feedModel = FeedModel()

    lazy var collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Constants.awsGray1
        return cv
    }()

    lazy var thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        iv.image = UIImage(named: "channelDragonPlaceholder.png")
        return iv
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.darkGray
        return label
    }()

    lazy var stackview: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [thumbnailImageView, titleLabel])
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        sv.spacing = 3
        return sv
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        collectionView1.delegate = self
        collectionView1.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented:")
    }

    func setupView() {
        addSubview(collectionView1)
        collectionView1.register(Feed1CollectionViewCell.self, forCellWithReuseIdentifier: "feedCellId1")
        collectionView1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FeedModel.feedVideos.items?.count ?? 0
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId1", for: indexPath) as! Feed1CollectionViewCell
        guard let video = FeedModel.feedVideos.items?[indexPath.section].snippet else { return cell }
        cell.thumbnailImageView.sd_setShowActivityIndicatorView(true)
        cell.thumbnailImageView.sd_setIndicatorStyle(.whiteLarge)
        let imageUrl = URL(string: (video.thumbnails?.medium?.url ?? ""))
        if imageUrl != nil {
            cell.thumbnailImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named:  "dragonPlaceholder.jpg"), options: .highPriority, completed: nil)
        }
        cell.backgroundColor = Constants.awsRed
        cell.configure(with: video)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = width * 9 / 16
        VideoCell.videoHeight = height
        return CGSize(width: 300, height: 200)
//        return CGSize(width: width * 0.70, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func configure(with video: Snippet?) {
        guard let video = video else { return }
        titleLabel.text = video.title
    }

}



//============
//    lazy var collectionView1: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 10
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .yellow
//        return cv
//    }()
//
//    lazy var thumbnailImageView: UIImageView = {
//        let iv = UIImageView()
//        iv.contentMode = .scaleAspectFit
//        iv.layer.cornerRadius = 10
//        iv.layer.masksToBounds = true
//        iv.clipsToBounds = true
//        iv.image = UIImage(named: "channelDragonPlaceholder.png")
//        return iv
//    }()
//
//    lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 13.0)
//        label.lineBreakMode = .byWordWrapping
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.backgroundColor = UIColor.clear
//        label.textColor = UIColor.darkGray
//        return label
//    }()
//
//    lazy var stackview: UIStackView = {
//        let sv = UIStackView(arrangedSubviews: [thumbnailImageView, titleLabel])
//        sv.axis = .horizontal
//        sv.distribution = .fillProportionally
//        sv.spacing = 3
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
//
//        stackview.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
////        thumbnailImageView.snp.makeConstraints { make in
////            make.leading.top.trailing.equalToSuperview().offset(3)
////            make.width.height.equalTo(200)
////        }
////
////        titleLabel.snp.makeConstraints { make in
////            make.leading.equalTo(thumbnailImageView.snp.trailing)
////            make.top.equalToSuperview().offset(3)
////            make.trailing.equalToSuperview().offset(-3)
////        }
//    }
//
//    func configure(with video: Snippet?) {
//        guard let video = video else { return }
//        titleLabel.text = video.title
//    }
//}
