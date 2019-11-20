//
//  FeedMainCollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/10/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class FeedMainCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let feedModel = FeedModel()

    lazy var collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Constants.awsGray1
        return cv
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
        return 1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FeedModel.feedVideos.items?.count ?? 0
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
        let width = UIScreen.main.bounds.width * 0.75 - 12
        let height = width * 9 / 16
        VideoCell.videoHeight = height
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 6, bottom: 0, right: 6)
    }
}
