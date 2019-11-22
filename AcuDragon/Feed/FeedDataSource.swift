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
    private let feedModel = FeedModel()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId0", for: indexPath) as! Feed0CollectionViewCell

        if indexPath.section == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId0", for: indexPath) as! Feed0CollectionViewCell
            cell.backgroundColor = .white
            return cell
        }

//        if indexPath.section == 1 {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId2", for: indexPath) as! Feed0CollectionViewCell
//            cell.backgroundColor = Constants.awsGray2
//            return cell
//        }
//
//        // header == 2
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId0", for: indexPath) as! Feed0CollectionViewCell
//        cell.backgroundColor = Constants.awsGray2
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (UIScreen.main.bounds.width * 9 / 16) + 40
        return CGSize(width: UIScreen.main.bounds.width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: "HeaderCollectionReusableView", withReuseIdentifier: "headerCellId", for: indexPath) as! HeaderCollectionReusableView
        view.headerLabel.text = view.setup(headerFor: indexPath.section)
        return view
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 25)
    }
}
