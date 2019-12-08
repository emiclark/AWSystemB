//
//  Video.swift
//  AcuDragon
//
//  Created by Emiko Clark on 1/25/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

// original response
class Video: Decodable {
    var items: [Items]?
    var etag: String?
}

class Items: Decodable {
    var etag: String?
    var id: Id?
    var snippet: Snippet?
    var channelTitle: String?
    var status: Status?
}

struct Id: Decodable {
    var playlistId: String?
    var kind: String?
    var videoId: String?
}

struct Snippet: Decodable {
    var channelId: String?
    var title: String?
    var description: String?
    var thumbnails: VideoThumbnails?
}

struct VideoThumbnails: Decodable {
    var medium: Thumbnails?
    var high: Thumbnails?
}

struct Thumbnails: Decodable {
    var url: String?
    var width: Int?
    var height: Int?
}

struct Status: Decodable {
    var privacyStatus: String?
}
