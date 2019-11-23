//
//  Constants.swift
//  AcuDragon

//
//  Created by Emiko Clark on 4/6/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit


struct Constants {
    static let baseUrlString = "https://www.googleapis.com/youtube/v3/search?key="
    static let myAPIKey = "AIzaSyCz7ChsZALe88gbZuQyexQY82oQ1de6qZU"
    static let pageNum = 15
    static let awsRed   = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1.0)
    static let awsGray1 = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    static let awsGray2 = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    static let awsGray3 = UIColor(red: 175/255, green: 175/255, blue: 175/255, alpha: 1.0)
    static let awsGray4 = UIColor(red: 125/255, green: 125/255, blue: 125/255, alpha: 1.0)
    static let awsGray5 = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
}


/* ec channel response ============
 https://www.googleapis.com/youtube/v3/search?key=AIzaSyCz7ChsZALe88gbZuQyexQY82oQ1de6qZU&channelId=UCD5kT8GTKnbYl9WxgnLM0aA&part=snippet,id,status&maxResults=20
 https:www.googleapis.com/youtube/v3/search?key=AIzaSyDmqaPH8yJO7uMfTUXz9AKxP5zdb79ym0Q&channelId=UCD5kT8GTKnbYl9WxgnLM0aA&part=snippet&maxResults=20
 // returns playlist for ec channel 50 items
 https://www.googleapis.com/youtube/v3/playlistItems?playlistId=UUD5kT8GTKnbYl9WxgnLM0aA&key=AIzaSyCz7ChsZALe88gbZuQyexQY82oQ1de6qZU&part=snippet&maxResults=50
 
 
 //     static let myAPIKey = "AIzaSyDmqaPH8yJO7uMfTUXz9AKxP5zdb79ym0Q"
 //     static let myECChannel = "UCD5kT8GTKnbYl9WxgnLM0aA"
 ==================================
 */
