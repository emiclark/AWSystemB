//
//  Feed2CollectionViewCell.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/17/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit
import SnapKit

class Feed2CollectionViewCell: UICollectionViewCell {

    lazy var collectionView1: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .orange
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented:")
    }

    func setupView() {
        addSubview(collectionView1)
        backgroundColor = .lightGray

        collectionView1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
