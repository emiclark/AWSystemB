//
//  DetailViewController.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/19/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let video: Snippet?

//    init(video: Snippet) {
//        super.init()
//        self.video = video
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        setupViews()
    }

    func setupViews() {

    }
 }
