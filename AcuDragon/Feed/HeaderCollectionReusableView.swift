//
//  HeaderCollectionReusableView.swift
//  AcuDragon
//
//  Created by Emiko Clark on 11/11/19.
//  Copyright © 2019 Emiko Clark. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    public static let cellId = "cellIdHeader"

    var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .darkGray
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
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-5)
        }
    }

    func setup(headerLabel forSection: Int) -> String {
        var headerText = ""
        switch forSection {
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
