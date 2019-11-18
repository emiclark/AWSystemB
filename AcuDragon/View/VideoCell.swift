//
//  VideoCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 1/23/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit

class VideoCell: UICollectionViewCell {
    
    var videoItem = Items()
    var delegate: reloadDataDelegate?
    static var videoHeight: CGFloat = 0.0
    
    enum MyKeys: String, CodingKey {
        case thumbnail = "thumbnails"
        case urlString = "url"
    }
    
    var video: Video? {
        didSet {
            
//            let videoItem = Item()

            // setup views and constraints
            setupViews()

            guard let titleLabel1 = videoItem.snippet?.title,
                  let subtitleLabel1 = videoItem.snippet?.description
                else { print("title nil"); return }
            
            titleLabel.text = titleLabel1
            subtitleLabel.text = subtitleLabel1
            
        }
    }

    lazy var thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = UIImage(named: "channelDragonPlaceholder.png")
        return iv
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.darkGray
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = UIColor.white
        label.textColor = UIColor.darkGray
        return label
    }()
    
    lazy var separater: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 230/255)
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        sv.distribution = .fillProportionally
        sv.axis = .vertical
        return sv
    }()
    
    func setupViews() {
        backgroundColor = UIColor.white
        
        // add views
        addSubview(thumbnailImageView)
        addSubview(stackView)
        addSubview(separater)

        thumbnailImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(200)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView).offset(3)
            make.left.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-3)
        }

        separater.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    func downloadImage(imageType: String, urlString: String) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                guard let data = data else { return }
                
                DispatchQueue.main.async() {
                    self.thumbnailImageView.image = UIImage(data: data)
                    self.delegate?.updateUI()
                }
            }.resume()
        }
    }
}
