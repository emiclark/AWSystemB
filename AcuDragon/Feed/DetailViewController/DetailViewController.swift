//
//  DetailViewController.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/19/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var video: Snippet?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        self.title = "Detail VC"
        setupViews()
    }

    func setupViews() {
    }
 }
