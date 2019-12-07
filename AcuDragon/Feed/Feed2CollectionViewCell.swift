//  Feed2CollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/17/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class Feed2CollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let feedModel = FeedModel()
    public static let cellId = "cellId2"

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(Feed2Cell.self, forCellWithReuseIdentifier: Feed2CollectionViewCell.cellId)
        setupView()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    required init?(coder: NSCoder) {
       super.init(coder: coder)
    }

    func setupView() {
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return FeedModel.feedVideos.items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Feed2CollectionViewCell.cellId, for: indexPath) as! Feed2Cell

        let video = FeedModel.feedVideos.items?[indexPath.row].snippet
        cell.configure(with: video)

        cell.thumbnailImageView.sd_setShowActivityIndicatorView(true)
        cell.thumbnailImageView.sd_setIndicatorStyle(.whiteLarge)
        let imageUrl = URL(string: (video?.thumbnails?.medium?.url ?? ""))
        if imageUrl != nil {
            cell.thumbnailImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named:  "dragonPlaceholder.jpg"), options: .highPriority, completed: nil)
        }

        // cell rounded corner
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.clipsToBounds = true
        cell.backgroundColor = .white

        // cell shadow
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 0.6
        cell.layer.masksToBounds = false
        cell.layer.shouldRasterize = true

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40.0
    }

    func itemSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = width * 9 / 16
        VideoCell.videoHeight = height
        return CGSize(width: width * 0.50, height: height - 35)
     }
}
