//
//  FeedDataSource.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/10/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
//import SDWebImages

class FeedDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var presentViewController: ((UIViewController) -> Void)?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var cell: UICollectionViewCell
//        cell = collectionView.dequeueReusableCell(withReuseIdentifier: Feed0CollectionViewCell.cellId, for: indexPath) as! Feed0CollectionViewCell

        switch indexPath.section {
            case 0:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: Feed0CollectionViewCell.cellId, for: indexPath) as! Feed0CollectionViewCell
            case 1:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: Feed1CollectionViewCell.cellId, for: indexPath) as! Feed1CollectionViewCell
            case 2:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: Feed2CollectionViewCell.cellId, for: indexPath) as! Feed2CollectionViewCell
              default:
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: Feed2CollectionViewCell.cellId, for: indexPath) as! Feed2CollectionViewCell
        }

//        configure(cell)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 0.0

        switch (indexPath.section) {
            case 0:
                height = 250
            case 1:
                height = 260
            case 2:
                height = 200
            default:
                height = 200
        }

        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: "HeaderCollectionReusableView", withReuseIdentifier: HeaderCollectionReusableView.cellId, for: indexPath) as! HeaderCollectionReusableView
        view.headerLabel.text = view.setup(headerLabel: indexPath.section)
        return view
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.video = FeedModel.feedVideos.items?[indexPath.section].snippet
        self.presentViewController?(vc)
    }
}
