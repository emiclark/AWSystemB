//
//  FeedViewController.swift
//  GoogleAPIClientForREST
//
//  Created by Emiko Clark on 11/10/19.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController, UICollectionViewDelegate {

    private let feedModel = FeedModel()
    private let feedDatasource = FeedDataSource()

    var feedCollectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Constants.awsGray1
        return cv
    }()

    lazy var logoView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "dragonRed.jpg")
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = Constants.awsGray1
        self.navigationItem.titleView = logoView

        feedCollectionview.delegate = feedDatasource
        feedCollectionview.dataSource = feedDatasource
        feedCollectionview.register(Feed0CollectionViewCell.self, forCellWithReuseIdentifier: "feedCellId0")
        feedCollectionview.register(Feed1CollectionViewCell.self, forCellWithReuseIdentifier: "feedCellId1")
        feedCollectionview.register(Feed2CollectionViewCell.self, forCellWithReuseIdentifier: "feedCellId2")
        feedCollectionview.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: "HeaderCollectionReusableView", withReuseIdentifier: "headerCellId")
        setupFeedViewController()
        feedModel.getTestData()
    }

    func setupFeedViewController() {
        view.addSubview(feedCollectionview)

        feedCollectionview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension FeedViewController : reloadDataDelegate {
    func updateUI() {
        self.feedCollectionview.reloadData()
    }
}
