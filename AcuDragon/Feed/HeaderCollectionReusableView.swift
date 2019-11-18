//
//  HeaderCollectionReusableView.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/11/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    var headerLabel: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    func setupViews() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(10)
        }
    }

    func setup(headerFor section: Int) -> String {
        var headerText = ""
        switch section {
            case 0:
                headerText = "Header 1"
            case 1:
                headerText = "Header 2"
            case 2:
                headerText = "Header 3"
            default:
                headerText = "default"
        }
        return headerText
    }
}
