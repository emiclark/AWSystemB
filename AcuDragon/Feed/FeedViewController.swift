//
//  FeedViewController.swift
//  GoogleAPIClientForREST
//
//  Created by Emiko Clark on 11/10/19.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDelegate {

    let feedDatasource = FeedDataSource()
    let flowLayout = UICollectionViewLayout()

    override func viewDidLoad() {
        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
        super.viewDidLoad()
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: "feedCellId")
        collectionView.delegate = self
        collectionView.dataSource = feedDatasource
        collectionView.backgroundColor = .purple
        
        setupFeedViewController()
        view.addSubview(collectionView)
    }

    func setupFeedViewController() {
        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
    }
}

//// MARK:- Extensions
//extension FeedViewController : reloadDataDelegate {
//    func updateFeedUI() {
//        self.activityIndicator.stopAnimating()
//        self.activityIndicator.isHidden = true
//        self.collectionView?.reloadData()
//    }
//}

//===================== refactor for tabbar ==============
//class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    var activityIndicator: UIActivityIndicatorView!
//    let apiClient = ApiClient()
//    let pageNum = Constants.pageNum
//    var isEmptyStateFlag = true
//
//    // MARK:- View Methods
//    override func viewWillAppear(_ animated: Bool) {
//        initializeVideoModelForEmptyState()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        apiClient.delegate = self
//        collectionView?.backgroundColor = .white
//
//        startActivityIndicator()
//        setupViewController()
////        self.apiClient.fetchVideos(pageNum: pageNum)
//
//        // for test purpose using local json
//        if isEmptyStateFlag == true {
//            setupViewController()
//        } else {
//            // regular api call
//            //        self.apiClient.fetchVideos(pageNum: pageNum)
//
//        }
//
//    }
//
//    // MARK:- Setup/Initialization Methods
//    func initializeVideoModelForEmptyState() {
//
//        // create empty video array for empty state
//        let videoArray = Video()
//        videoArray.etag = " "
//        videoArray.items = [Items]()
//
//        let itemsArr = Items()
//        itemsArr.etag = " "
//        itemsArr.channelTitle = " "
//        itemsArr.id = Id()
//        itemsArr.id?.playlistId = " "
//
//        var snippet = Snippet()
//        snippet.channelId = " "
//        snippet.title = " "
//        snippet.description = " "
//
//        var videoThumbnails = VideoThumbnails()
//        videoThumbnails.high = Thumbnails()
//
//        videoThumbnails.high?.url = " "
//        videoThumbnails.high?.height = 0
//        videoThumbnails.high?.width = 0
//
//        snippet.thumbnails = videoThumbnails
//        itemsArr.snippet = snippet
//        videoArray.items?.append(itemsArr)
//        ApiClient.videosArray = videoArray
//    }
//
//    func startActivityIndicator() {
//        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
//        self.activityIndicator.color = .blue
//        self.activityIndicator.center = view.center
//        self.activityIndicator.hidesWhenStopped = false
//        self.activityIndicator.startAnimating()
//        view.addSubview(self.activityIndicator)
//    }
//
//    func setupViewController() {
//        // Register cell
//        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
//
//        // adjust collectionview and scrollview to begin below menubar
//        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
//        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
//
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
//
//    }
//
//    // MARK:- CollectionView Delegate Methods
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (ApiClient.videosArray.items?.count)!
//    }
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
//        let videoInfo = ApiClient.videosArray.items![indexPath.row]
//        cell.backgroundColor = .cyan
//
//        // use test data to check formating
//        if isEmptyStateFlag == true {
//            // empty state - draw minimal collectionview - get data from local file
//            apiClient.EmptyFlagIsTrueGetDataFromLocalFile()
//            isEmptyStateFlag = false
//        }
//        else {
//            // api called successfully
//            if videoInfo.id?.kind == "youtube#video" {
//                cell.titleLabel.text =  videoInfo.snippet?.title
//                cell.subtitleLabel.text =  videoInfo.snippet?.description
//                // MARK:- FIXME recusive download of thumbnails
////                apiClient.downloadImage(urlString: (videoInfo.snippet?.thumbnails?.high?.url!)!) { (thumbnailImage) in
////                    cell.thumbnailImageView.image = thumbnailImage
////                }
//            }
//        }
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = (view.frame.width - 16 - 16) * 9 / 16
//        VideoCell.videoHeight = height
//        return CGSize(width: view.frame.width, height: height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//}
//
//// MARK:- Extensions
//extension HomeController : reloadDataDelegate {
//    func updateUI() {
//        self.activityIndicator.stopAnimating()
//        self.activityIndicator.isHidden = true
//        self.collectionView?.reloadData()
//    }
//}


