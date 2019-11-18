////
////  ViewController.swift
////  AcuDragon
////
////  Created by Emiko Clark on 1/22/18.
////  Copyright © 2018 Emiko Clark. All rights reserved.
////
//
//import UIKit
//
//class HomeController: UIViewController, UICollectionViewDelegate {
//
//    let feedCollectionView: UICollectionViewController!
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
//        feedCollectionView.delegate = self
//        feedCollectionView.dataSource = self
//        feedCollectionView?.backgroundColor = .white
//
//        let layout = UICollectionViewFlowLayout()
//        feedCollectionView = UICollectionView(frame: layout)
//        feedCollectionView.register(feedCollectionViewCell.self, forCellWithReuseIdentifier: "feedCell")
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
//
////===================== refactor for tabbar ==============
////class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
////
////    var activityIndicator: UIActivityIndicatorView!
////    let apiClient = ApiClient()
////    let pageNum = Constants.pageNum
////    var isEmptyStateFlag = true
////
////    // MARK:- View Methods
////    override func viewWillAppear(_ animated: Bool) {
////        initializeVideoModelForEmptyState()
////    }
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        apiClient.delegate = self
////        collectionView?.backgroundColor = .white
////
////        startActivityIndicator()
////        setupViewController()
//////        self.apiClient.fetchVideos(pageNum: pageNum)
////
////        // for test purpose using local json
////        if isEmptyStateFlag == true {
////            setupViewController()
////        } else {
////            // regular api call
////            //        self.apiClient.fetchVideos(pageNum: pageNum)
////
////        }
////
////    }
////
////    // MARK:- Setup/Initialization Methods
////    func initializeVideoModelForEmptyState() {
////
////        // create empty video array for empty state
////        let videoArray = Video()
////        videoArray.etag = " "
////        videoArray.items = [Items]()
////
////        let itemsArr = Items()
////        itemsArr.etag = " "
////        itemsArr.channelTitle = " "
////        itemsArr.id = Id()
////        itemsArr.id?.playlistId = " "
////
////        var snippet = Snippet()
////        snippet.channelId = " "
////        snippet.title = " "
////        snippet.description = " "
////
////        var videoThumbnails = VideoThumbnails()
////        videoThumbnails.high = Thumbnails()
////
////        videoThumbnails.high?.url = " "
////        videoThumbnails.high?.height = 0
////        videoThumbnails.high?.width = 0
////
////        snippet.thumbnails = videoThumbnails
////        itemsArr.snippet = snippet
////        videoArray.items?.append(itemsArr)
////        ApiClient.videosArray = videoArray
////    }
////
////    func startActivityIndicator() {
////        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
////        self.activityIndicator.color = .blue
////        self.activityIndicator.center = view.center
////        self.activityIndicator.hidesWhenStopped = false
////        self.activityIndicator.startAnimating()
////        view.addSubview(self.activityIndicator)
////    }
////
////    func setupViewController() {
////        // Register cell
////        self.collectionView!.register(VideoCell.self, forCellWithReuseIdentifier: "cellid")
////
////        // adjust collectionview and scrollview to begin below menubar
////        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
////        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
////
////        navigationController?.navigationBar.isTranslucent = false
////        navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
////
////    }
////
////    // MARK:- CollectionView Delegate Methods
////    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return (ApiClient.videosArray.items?.count)!
////    }
////
////    override func numberOfSections(in collectionView: UICollectionView) -> Int {
////        return 1
////    }
////
////    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! VideoCell
////        let videoInfo = ApiClient.videosArray.items![indexPath.row]
////        cell.backgroundColor = .cyan
////
////        // use test data to check formating
////        if isEmptyStateFlag == true {
////            // empty state - draw minimal collectionview - get data from local file
////            apiClient.EmptyFlagIsTrueGetDataFromLocalFile()
////            isEmptyStateFlag = false
////        }
////        else {
////            // api called successfully
////            if videoInfo.id?.kind == "youtube#video" {
////                cell.titleLabel.text =  videoInfo.snippet?.title
////                cell.subtitleLabel.text =  videoInfo.snippet?.description
////                // MARK:- FIXME recusive download of thumbnails
//////                apiClient.downloadImage(urlString: (videoInfo.snippet?.thumbnails?.high?.url!)!) { (thumbnailImage) in
//////                    cell.thumbnailImageView.image = thumbnailImage
//////                }
////            }
////        }
////        return cell
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let height = (view.frame.width - 16 - 16) * 9 / 16
////        VideoCell.videoHeight = height
////        return CGSize(width: view.frame.width, height: height)
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 0
////    }
////}
////
////// MARK:- Extensions
////extension HomeController : reloadDataDelegate {
////    func updateUI() {
////        self.activityIndicator.stopAnimating()
////        self.activityIndicator.isHidden = true
////        self.collectionView?.reloadData()
////    }
////}
//
//



//===      backup FeedVC - after adding 3 sections and cleaning up code ============

//
//
//
//
//
//
//
//==
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = (view.frame.width - 16 - 16) * 9 / 16
//        VideoCell.videoHeight = height
//        return CGSize(width: view.frame.width, height: height)
//    }
//
//
//==
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId", for: indexPath) as! FeedCollectionViewCell
//            cell.backgroundColor = .cyan
//
//            if let videoInfo = feedModel.feedVideos.items?[indexPath.row].snippet {
//                cell.configure(with: videoInfo)
//            }
//==
//
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

//== backup homecontroller
//=======
    // MARK:- CollectionView Delegate Methods
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (ApiClient.videosArray.items?.count)!
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCellId", for: indexPath) as! FeedCollectionViewCell
//        if let videoInfo = ApiClient.videosArray.items![indexPath.row].snippet {
//            cell.configure(with: videoInfo)
//        }
//
//        ApiClient.EmptyFlagIsTrueGetDataFromLocalFile()
//        cell.backgroundColor = .cyan
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
//=========

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




//== appDelegate backup =====
//======= old func b4 tabbar ============================
//func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let tabBarVC = HomeController()
//        window?.rootViewController = tabBarVC
//        window?.makeKeyAndVisible()
//
////        let vc = UIViewController()
////        let navigationController = UINavigationController(rootViewController: vc)
////        self.window?.rootViewController = navigationController
////        self.window!.makeKeyAndVisible()
////        let layout = UICollectionViewFlowLayout()
////        window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
//
//        // remove black bar beneath navbar
////        UINavigationBar.appearance().shadowImage = UIImage()
////        UINavigationBar.appearance().setBackgroundImage(UIImage(),for: .default)
//
////        application.statusBarStyle = .lightContent
//
//        // add darker red to status bar
////        let statusBarView = UIView()
////        statusBarView.backgroundColor = UIColor.rgb(red: 194, green: 40, blue: 40)
////        window?.addSubview(statusBarView)
////        window?.addConstraintsWithFormat(format: "H:|[v0]|", views: statusBarView)
////        window?.addConstraintsWithFormat(format: "V:|[v0(30)]", views: statusBarView)
////
//        return true
//    }
//====================== below with google signIn ================
////
////  AppDelegate.swift
////  AcuDragon
////
////  Created by Emiko Clark on 1/22/18.
////  Copyright © 2018 Emiko Clark. All rights reserved.
////
//
//import UIKit
//import Google
//import GoogleSignIn
//
//@UIApplicationMain
////class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
//
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    let MY_CLIENT_ID = "844411766152-cjl9ofh6au9ntejf4fam6dhod4fnisg5.apps.googleusercontent.com"
//
//    //    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
//    //              withError error: Error!) {
//    //        if let error = error {
//    //            print("\(error.localizedDescription)")
//    //        } else {
//    //            // Perform any operations on signed in user here.
//    //            let userId = user.userID                  // For client-side use only!
//    //            let idToken = user.authentication.idToken // Safe to send to the server
//    //            let fullName = user.profile.name
//    //            let givenName = user.profile.givenName
//    //            let familyName = user.profile.familyName
//    //            let email = user.profile.email
//    //            // ...
//    //        }
//    //    }
//
//    //    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
//    //              withError error: Error!) {
//    //        // Perform any operations when the user disconnects from app here.
//    //        // ...
//    //    }
//
//    var window: UIWindow?
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        let vc = UIViewController()
//        let navigationController = UINavigationController(rootViewController: vc)
//        self.window?.rootViewController = navigationController
//        self.window!.makeKeyAndVisible()
//        let layout = UICollectionViewFlowLayout()
//        window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout: layout))
//
//        // remove black bar beneath navbar
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().setBackgroundImage(UIImage(),for: .default)
//
//        application.statusBarStyle = .lightContent
//
//        // add darker red to status bar
//        let statusBarView = UIView()
//        statusBarView.backgroundColor = UIColor.rgb(red: 194, green: 40, blue: 40)
//        window?.addSubview(statusBarView)
//        window?.addConstraintsWithFormat(format: "H:|[v0]|", views: statusBarView)
//        window?.addConstraintsWithFormat(format: "V:|[v0(30)]", views: statusBarView)
//
//        //         Initialize sign-in
//        //        GIDSignIn.sharedInstance().clientID = "YOUR_CLIENT_ID"
//        //        GIDSignIn.sharedInstance().delegate = self
//
//        // Initialize sign-in
//        var configureError: NSError?
//        GGLContext.sharedInstance().configureWithError(&configureError)
//        assert(configureError == nil, "Error configuring Google services: \(String(describing: configureError))")
//
//        return true
//    }
//
//    //    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
//    //        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String
//    //        let annotation = options[UIApplicationOpenURLOptionsKey.annotation]
//    //        return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
//    //    }
//
//    //    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//    //        return GIDSignIn.sharedInstance().handle(url,
//    //        sourceApplication: sourceApplication,
//    //        annotation: annotation)
//    //    }
//
//    func applicationWillResignActive(_ application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }
//
//
//}
//




//==  backup ApiClient =========================
//=========================================
////  b4 refactor to aws
//
//import UIKit
//
//protocol reloadDataDelegate {
//    func updateUI()
//}
//
//class ApiClient {
//
//    static var videosArray = Video()
//    var delegate: reloadDataDelegate?
//
//    func fetchVideos(pageNum: Int) {
//
//        //        let urlString = "https://www.googleapis.com/youtube/v3/playlists?part=id%2Cstatus&channelId=UCD5kT8GTKnbYl9WxgnLM0aA&list=PLkHZi0mdFMbx60Xr8ZV6naErxSbUIyldo&maxResults=20&key=AIzaSyCz7ChsZALe88gbZuQyexQY82oQ1de6qZU"
//
//        // EC url
//        //        let urlString = "\(Constants.baseUrlString)\(secret.myAPIKey)&channelId=\(secret.myECChannel)&part=snippet,id"
//
//        // AcuDragon search by channelId
//        let urlString = "\(Constants.baseUrlString)\(secret.myAPIKey)&channelId=\(secret.awsChannelId)&part=snippet,id&list=\(secret.awsplaylist_privateForApp)"
//
//        // AcuDragon search by playlist="All"
//        //        let urlString = "https://www.googleapis.com/youtube/v3/playlists?part=id%2Cstatus&channelId=\(secret.adChannelId)&list=\(secret.adplaylistAll)&maxResults=20&key=AIzaSyCz7ChsZALe88gbZuQyexQY82oQ1de6qZU"
//
//        let url = URL(string: urlString)
//        let urlRequest = URLRequest(url: url!)
//
//        getVideoData(urlRequest: urlRequest, completion: { (Video) in
//            ApiClient.videosArray = Video
//
//            DispatchQueue.main.async() {
//                self.delegate?.updateUI()
//            }
//        })
//    }
//
//    func getVideoData(urlRequest: URLRequest, completion: @escaping (_ jsonArr: Video) -> ()) {
//
//        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//
//            if error != nil {
//                print(error!)
//                return
//            }
//
//            guard let data  = data else { return }
//
//            do {
//                ApiClient.videosArray = try JSONDecoder().decode(Video.self, from: data)
//
//                DispatchQueue.main.async {
//                    dump(ApiClient.videosArray)
//                    //                    print((ApiClient.videosArray.items?.count)!)
//
//
//                    // not returning private/unlisted. status = nil. should be public at the least.
//                    for item in ApiClient.videosArray.items!  {
//                        if item.status?.privacyStatus! == "private" || item.status?.privacyStatus! == "unlisted" {
//                            print("\n",item.etag!, item.id!, (item.status?.privacyStatus!)!)
//                        }
//
//                    }
//                }
//
//                completion(ApiClient.videosArray)
//
//            } catch let error {
//                print(error)
//            }
//            }.resume()
//    }
//
//
//    func downloadImage(urlString: String, completion: @escaping(UIImage?)->()) {
//
//        if let url = URL(string: urlString) {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//
//                guard let data = data else { return }
//                let img = UIImage(data: data)
//
//                DispatchQueue.main.async() {
//                    completion(img)
//                    //                    self.delegate?.updateUI()
//                }
//                }.resume()
//        }
//    }
//
//    //    func downloadImage(imageType: String, urlString: String) {
//    //        if let url = URL(string: urlString) {
//    //            URLSession.shared.dataTask(with: url) { (data, response, error) in
//    //                if error != nil {
//    //                    print(error!)
//    //                    return
//    //                }
//    //                guard let data = data else { return }
//    //
//    //                DispatchQueue.main.async() {
//    //                    if imageType == "videoThumbnail" {
//    //                        self.thumbnailImageView.image = UIImage(data: data)
//    //                    } else if imageType == "profile_image" {
//    //                        self.profileImageView.image = UIImage(data: data)
//    //                    }
//    //                    self.delegate?.updateUI()
//    //                }
//    //                }.resume()
//    //        }
//    //    }
//
//}


//==




//    func getVideoData(urlRequest: URLRequest, completion: @escaping (_ jsonArr: Video) -> ()) {
//
//
//        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//
//            if error != nil {
//                print(error!)
//                return
//            }
//
//            guard let data  = data else { return }
//
//            do {
//                let decodeJson = JSONDecoder()
//
//                ApiClient.videosArray = try JSONDecoder().decode(Video.self, from: data)
//
//                DispatchQueue.main.async {
//                    dump(ApiClient.videosArray)
////                    print((ApiClient.videosArray.items?.count)!)
//                }
//
//                completion(ApiClient.videosArray)
//
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }





//================ backup VideoCell ---------------
////======= backup v1 ======
////
////  VideoCell.swift
////  AcuDragon
////
////  Created by Emiko Clark on 1/23/18.
////  Copyright © 2018 Emiko Clark. All rights reserved.
////
//
//import UIKit
//
//class VideoCell: BaseCell {
//
//    var video: Video? {
//        didSet {
//
//            if let thumbnail_image_name = video?.thumbnail_image_name {
//                downloadImage(imageType: "thumbnail_image_name", urlString: thumbnail_image_name)
//            }
//
//            if let profile_image_name  = video?.channel?.profile_image_name {
//                downloadImage(imageType: "profile_image_name", urlString: profile_image_name)
//            }
//
//            titleLabel.text = video?.title
//
//            if let channelSubtitle = video?.subTitle, ((video?.channel?.name) != nil) {
//                let subtitleText = "\(String(describing: (video?.channel?.name)!)) - \(channelSubtitle)"
//                subTitleTextView.text = subtitleText
//            }
//
//            // estimate height for titleLabelText
//            if let title = video?.title {
//                let size = CGSize(width: frame.size.width - 16 - 44 - 8 - 16, height: 1000)
//                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
//                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17)] , context: nil)
//
//                if estimatedRect.size.height > 21 {
//                    titleLabelHeightConstraint?.constant = 44
//                } else {
//                    titleLabelHeightConstraint?.constant = 21
//                }
//                print("estimatedRect:", estimatedRect)
//            }
//
//            // estimate height for subTitle
//            // estimate height for VideoCell (video+16+titleLabelHeight+8+subTitleLabelHeight+16)
//        }
//    }
//
//    var profileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 22
//        imageView.layer.masksToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = #imageLiteral(resourceName: "dragon")
//        return imageView
//    }()
//
//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.lineBreakMode = NSLineBreakMode.byWordWrapping
//        label.sizeToFit()
//        return label
//    }()
//
//    let subTitleTextView: UITextView = {
//        let textview = UITextView()
//        textview.translatesAutoresizingMaskIntoConstraints = false
//        textview.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
//        textview.textColor = UIColor.lightGray
//        return textview
//    }()
//
//    let separaterView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 230/255)
//        return view
//    }()
//
//    let thumbnailImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = UIColor.cyan
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = #imageLiteral(resourceName: "dragon")
//        return imageView
//    }()
//
//    var titleLabelHeightConstraint: NSLayoutConstraint?
//
//    override func setupViews() {
//        backgroundColor = UIColor.white
//        addSubview(thumbnailImageView)
//        addSubview(separaterView)
//        addSubview(profileImageView)
//        addSubview(titleLabel)
//        addSubview(subTitleTextView)
//
//        // constraints
//        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
//        addConstraintsWithFormat(format: "H:|-16-[v0(44)]-[v1]-16-|", views: profileImageView, titleLabel)
//        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, profileImageView, separaterView)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: separaterView)
//
//        // titleLabel constraints
//        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
//        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left , relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8))
//        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right , relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
//
//        titleLabelHeightConstraint = (NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44))
//        addConstraint(titleLabelHeightConstraint!)
//
//        // subTitleTextView constraints
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .left , relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8))
//        addConstraint(NSLayoutConstraint(item: subTitleTextView, attribute: .right , relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: subTitleTextView , attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
//    }
//
//    func downloadImage(imageType: String, urlString: String) {
//        if let url = URL(string: urlString) {
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print(error!)
//                    return
//                }
//                guard let data = data else { return }
//
//                DispatchQueue.main.async() {
//                    if imageType == "thumbnail_image_name" {
//                        self.thumbnailImageView.image = UIImage(data: data)
//                    } else if imageType == "profile_image_name" {
//                        self.profileImageView.image = UIImage(data: data)
//                    }
//
//                }
//                }.resume()
//        }
//    }
//
//}

//=================== backup viewDidLoad 2/24/18 ====================
//var video: Video? {
//    didSet {
//
//        //            guard let thumbnails: [Thumbnails] = video?.thumbnails else { return }
//
//
//        guard let thumbnails = video?.thumbnails, let thumbnailUrlString = thumbnails["default"] else { return }
//
//
//        //                if let thumbnailSize = thumbnails["standard"] { return }
//        // FIX urlString - extract thumbnailImageString = "/"Ja4BwMEbfqE"
//        // "url": "https:\/\/i.ytimg.com\/vi\/Ja4BwMEbfqE\/maxresdefault.jpg"
//        // "url": "https://i.ytimg.com/vi/ + thumbnailImageString + /maxresdefault.jpg",
//
//        //                let tempURL = NSURL(string: "https:\/\/i.ytimg.com\/vi\/Ja4BwMEbfqE\/maxresdefault.jpg")
//
//
//        //                guard let thumbnailSize = thumbnailSize["default"] else { return }
//        //                downloadImage(imageType: thumbnailSize, urlString: thumbailSizeURLString)
//        //            }
//
//        if let profile_image_name  = video?.channel?.profile_image_name {
//            downloadImage(imageType: "profile_image_name", urlString: profile_image_name)
//        }
//
//        titleLabel.text = video?.title
//
//        if let channelSubtitle = video?.videoDescription, ((video?.channel?.name) != nil) {
//            let subtitleText = "\(String(describing: (video?.channel?.name)!)) - \(channelSubtitle)"
//            subTitleTextView.text = subtitleText
//        }
//
//        // estimate height for titleLabelText
//        if let title = video?.title {
//            let size = CGSize(width: frame.size.width - 16 - 44 - 8 - 16, height: 1000)
//            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
//            let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17)] , context: nil)
//
//            if estimatedRect.size.height > 21 {
//                titleLabelHeightConstraint?.constant = 44
//            } else {
//                titleLabelHeightConstraint?.constant = 21
//            }
//            print("estimatedRect:", estimatedRect)
//        }
//
//        // estimate height for subTitle
//        // estimate height for VideoCell (video+16+titleLabelHeight+8+subTitleLabelHeight+16)
//    }
//}

