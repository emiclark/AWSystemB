//
//  Feed2CollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/17/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit

class Feed2CollectionViewCell: UICollectionViewCell {

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

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.lightGray
        return label
    }()

    lazy var stackview: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
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

        thumbnailImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(150)
        }

        stackview.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.trailing)
            make.top.bottom.trailing.equalToSuperview()
        }

//        titleLabel.snp.makeConstraints { make in
//            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(5)
//            make.top.equalToSuperview()
//            make.trailing.equalToSuperview().offset(5)
//        }
//
//        subtitleLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(5)
//            make.trailing.equalToSuperview().offset(5)
//        }
    }

    func configure(with video: Snippet?) {
        guard let video = video else { return }
        titleLabel.text = video.title
        subtitleLabel.text = video.description
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FeedModel.feedVideos.items?.count ?? 0
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId2", for: indexPath) as! Feed2CollectionViewCell
        guard let video = FeedModel.feedVideos.items?[indexPath.section].snippet else { return cell }
        cell.thumbnailImageView.sd_setShowActivityIndicatorView(true)
        let imageUrl = URL(string: (video.thumbnails?.medium?.url ?? ""))
        if imageUrl != nil {
            cell.thumbnailImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named:  "dragonPlaceholder.jpg"), options: .highPriority, completed: nil)
        }
        cell.configure(with: video)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = width * 9 / 16
        VideoCell.videoHeight = height
        return CGSize(width: width * 0.40, height: height * 0.50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        let video = FeedModel.feedVideos.items?[indexPath.row].snippet
    //        let vc = DetailViewController()
    //        vc.video = video
    //        UINavigationController.pushViewController(vc)
    //
    //    }
}
