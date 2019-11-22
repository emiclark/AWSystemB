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
    static let awsRed = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 230/255)
    static let awsGray1 = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    static let awsGray2 = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0)
        static let awsGray3 = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
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
