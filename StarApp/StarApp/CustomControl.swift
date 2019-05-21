//
//  CustomControl.swift
//  StarApp
//
//  Created by Diante Lewis-Jolley on 5/21/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {

    var value: Int = 1

    private let compenentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInActiveColor = UIColor.gray
    let labels: [UILabel] = []

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)

        setup()

    }

    private func setup() {

        



    }






}
