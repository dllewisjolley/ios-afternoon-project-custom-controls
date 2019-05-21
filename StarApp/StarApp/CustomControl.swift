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
    var stars: [UILabel] = []

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)

        setup()

    }

    private func setup() {

        for index in 1...componentCount {
            let label = UILabel()
            label.tag = index
            let frame = CGRect(x: 8.0 + compenentDimension * CGFloat(index), y: 0, width: compenentDimension, height: compenentDimension)
            label.frame = frame
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textColor = componentInActiveColor
            label.text = "✩"

            addSubview(label)
            stars.append(label)
        }
    }

    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * compenentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: compenentDimension)
    }

    private func updateValue(at touch: UITouch) {
        let orgValue = value
        for star in stars {
            if star.frame.contains(touch.location(in: self)) {
                value = star.tag
                for index in 1...componentCount {
                    switch index <= value {
                    case true:
                        stars[index - 1].textColor = componentActiveColor

                    case false:
                        stars[index - 1].textColor = componentActiveColor
                    }
                }

                star.performFlare()
                if value != orgValue {
                    sendActions(for: [.valueChanged])
                }

            }
        }

    }

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown])

        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }

        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }

        let touchPoint = touch.location(in: self)

        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }


    }

    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }

        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}
