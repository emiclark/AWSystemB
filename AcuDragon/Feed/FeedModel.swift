//
//  FeedModel.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/17/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class FeedModel: NSObject {

    static var feedVideos = Video()
    var delegate: reloadDataDelegate?

    func getTestData() {
        // for test purpose only - read from local file
        if let url = Bundle.main.url(forResource: "aws1", withExtension: "txt") {
            do {
                let data = try Data(contentsOf: url)
                FeedModel.feedVideos = try JSONDecoder().decode(Video.self, from: data)
            } catch {
                print("error:\(error)")
            }
        }
        DispatchQueue.main.async() {
            self.delegate?.updateUI()
        }
    }
}
