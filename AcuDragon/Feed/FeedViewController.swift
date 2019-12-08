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
    let detailVC = DetailViewController()
    let cellId = "cellId"

    var feedCollectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
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
        feedCollectionview.backgroundColor = .white
        self.navigationItem.titleView = logoView
        feedCollectionview.delegate = feedDatasource
        feedCollectionview.dataSource = feedDatasource
        feedCollectionview.register(Feed0CollectionViewCell.self, forCellWithReuseIdentifier: Feed0CollectionViewCell.cellId)
        feedCollectionview.register(Feed1CollectionViewCell.self, forCellWithReuseIdentifier: Feed1CollectionViewCell.cellId)
        feedCollectionview.register(Feed2CollectionViewCell.self, forCellWithReuseIdentifier: Feed2CollectionViewCell.cellId)
        feedCollectionview.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: "HeaderCollectionReusableView", withReuseIdentifier: HeaderCollectionReusableView.cellId)
        setupFeedViewController()
        feedModel.getTestData()
        feedDatasource.presentViewController = { [weak self] viewController in
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
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
