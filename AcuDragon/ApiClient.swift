//
//  ApiClient.swift
//  AcuDragon
//
//  Created by Emiko Clark on 4/5/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

protocol reloadDataDelegate {
    func updateUI()
}

class ApiClient {

    var delegate: reloadDataDelegate?
    let feedModel = FeedModel()
    
    func fetchVideos(pageNum: Int) {

        // AcuDragon search by channelId
        let urlString = "https://www.googleapis.com/youtube/v3/playlists?part=id.kind=youtube#video&status&channelId=\(secret.awsChannelId)&list=\(secret.awsplaylist_privateForApp)&key=\(secret.myAPIKey)"

//        let urlString = "https://www.googleapis.com/youtube/v3/playlists?part=id.kind=youtube#video&status&channelId=\(secret.awsChannelId)&list=\(secret.awsplaylist_privateForApp)&key=AIzaSyCz7ChsZALe88gbZuQyexQY82oQ1de6qZU"


//        let urlString = "\(Constants.baseUrlString)\(secret.myAPIKey)&channelId=\(secret.awsChannelId)&part=snippet,id&list=\(secret.awsplaylist_privateForApp)"

        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)

        getVideoData(urlRequest: urlRequest, completion: { (Video) in
            FeedModel.feedVideos = Video

            DispatchQueue.main.async() {
                self.delegate?.updateUI()
            }
        })
    }

    func getVideoData(urlRequest: URLRequest, completion: @escaping (_ jsonArr: Video) -> ()) {

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

            if error != nil {
                print(error!)
                return
            }

            guard let data  = data else { return }

            do {
                let decodeJson = JSONDecoder()
                let result = try JSONDecoder().decode(Video.self, from: data)

                DispatchQueue.main.async { [weak self] in
                    dump(result)
                    print((result.items?.count)!)
                }

                completion(FeedModel.feedVideos)

            } catch let error {
                print("Failed to decode: \(error)")
                DispatchQueue.main.async {
                    //create alert box and present
                }
            }
        }.resume()
    }

    func downloadImage(urlString: String, completion: @escaping(UIImage?)->()) {

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }

                guard let data = data else { return }
                let img = UIImage(data: data)

                DispatchQueue.main.async() {
                    completion(img)
                    self.delegate?.updateUI()
                }
            }.resume()
        }
    }
}
