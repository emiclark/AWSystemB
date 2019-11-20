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
        if indexPath.section == 1 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId0", for: indexPath) as! FeedMainCollectionViewCell
           return cell
        }

        if indexPath.section == 2 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId0", for: indexPath) as! FeedMainCollectionViewCell
           return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId0", for: indexPath) as! FeedMainCollectionViewCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize(width: UIScreen.main.bounds.width, height: 200)

        if indexPath.section == 1 {
            size.height = 200
        }

        if indexPath.section == 2 {
            size.height = 200
        }
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: "HeaderCollectionReusableView", withReuseIdentifier: "headerCellId", for: indexPath) as! HeaderCollectionReusableView
        view.headerLabel.text = view.setup(headerFor: indexPath.section)
        return view
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40)
    }
}
