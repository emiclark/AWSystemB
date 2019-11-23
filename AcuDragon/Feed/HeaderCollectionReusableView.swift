//
//  HeaderCollectionReusableView.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/11/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .darkGray
        label.backgroundColor = .clear
        return label
    }()

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
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
        }
    }

    func setup(headerFor section: Int) -> String {
        var headerText = ""
        switch section {
            case 0:
                headerText = "Featured"
            case 1:
                headerText = "Qigong"
            case 2:
                headerText = "Meditation"
            default:
                headerText = "Other topics"
        }
        return headerText
    }
}
