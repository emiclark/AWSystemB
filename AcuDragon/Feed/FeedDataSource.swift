//
//  FeedDataSource.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/10/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

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
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId1", for: indexPath) as! Feed1CollectionViewCell
           cell.backgroundColor = .green
           return cell
        }

        if indexPath.section == 2 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId2", for: indexPath) as! Feed2CollectionViewCell
           cell.backgroundColor = .systemTeal
           return cell
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId0", for: indexPath) as! FeedMainCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var size = CGSize(width: UIScreen.main.bounds.width, height: 150)

        if indexPath.section == 1 {
            size.height = 250
        }

        if indexPath.section == 2 {
            size.height = 150
        }
        print(size)
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let view = collectionView.dequeueReusableSupplementaryView(ofKind: "HeaderCollectionReusableView", withReuseIdentifier: "headerCellId", for: indexPath) as! HeaderCollectionReusableView

        view.setup(count: indexPath.row)
        return view
    }
}








//==

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = (view.frame.width - 16 - 16) * 9 / 16
//        VideoCell.videoHeight = height
//        return CGSize(width: view.frame.width, height: height)
//    }


//==
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId", for: indexPath) as! FeedCollectionViewCell
//            cell.backgroundColor = .cyan
//
//            if let videoInfo = feedModel.feedVideos.items?[indexPath.row].snippet {
//                cell.configure(with: videoInfo)
//            }
//==

//=== b4 refactor to feedVC datasource and viewmodel
//class FeedDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//
//    // MARK:- CollectionView Delegate Methods
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//       return (ApiClient.videosArray.items?.count)!
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//       return 3
//    }
//
//    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedId", for: indexPath) as! FeedCollectionViewCell
//       let videoInfo = ApiClient.videosArray.items![indexPath.row]
//       cell.backgroundColor = .cyan
//
//       // use test data to check formating
//       if isEmptyStateFlag == true {
//           // empty state - draw minimal collectionview - get data from local file
//           apiClient.EmptyFlagIsTrueGetDataFromLocalFile()
//           isEmptyStateFlag = false
//       }
////       // make api call
////       else {
////           // api called successfully
////           if videoInfo.id?.kind == "youtube#video" {
////               cell.titleLabel.text =  videoInfo.snippet?.title
////               cell.subtitleLabel.text =  videoInfo.snippet?.description
////               // MARK:- FIXME recusive download of thumbnails
////           }
////       }
//
//       return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       let height = (view.frame.width - 16 - 16) * 9 / 16
//       VideoCell.videoHeight = height
//       return CGSize(width: view.frame.width, height: height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//       return 0
//    }
//}
