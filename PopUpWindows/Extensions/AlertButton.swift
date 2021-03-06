//
//  UIButton + Extension.swift
//  PopUpWindows
//
//  Created by Алексей Пархоменко on 25.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit

enum AlertButtonType {
    case purple
    case clear
}

enum AlertButtonSize {
    case small
    case medium
    case large
    
    func size() -> CGFloat {
        switch self {
        case .small:
            return 17
        case .medium:
            return 18
        case .large:
            return 24
        }
    }
}

enum ArrowDirection {
    case left
    case right
    case noArrow
}

class AlertButton: UIButton {
    
    var direction: ArrowDirection!
    var size: AlertButtonSize!
    var type: AlertButtonType!
    var arrowInsert: CGFloat?
    var arrowImageView = UIImageView()
    
    init(title: String? = nil, direction: ArrowDirection, size: AlertButtonSize, type: AlertButtonType) {
        super.init(frame: .zero)
        
        self.direction = direction
        self.size = size
        self.type = type
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.init(name: "Helvetica", size: 16)
        self.layer.cornerRadius = 25
        
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        setSize()
        setDirection()
        setType()
        setupArrow()
    }
    
    func setType() {
        switch type {
        case .clear:
            setTitleColor(#colorLiteral(red: 0.2549019608, green: 0.03921568627, blue: 0.8745098039, alpha: 1), for: .normal)
            backgroundColor = .clear
            arrowImageView.setupColor(color: #colorLiteral(red: 0.2549019608, green: 0.03921568627, blue: 0.8745098039, alpha: 1))
            layer.borderColor = #colorLiteral(red: 0.2549019608, green: 0.03921568627, blue: 0.8745098039, alpha: 1).cgColor
            layer.borderWidth = 1
        case .purple:
            self.backgroundColor = #colorLiteral(red: 0.2549019608, green: 0.03921568627, blue: 0.8745098039, alpha: 1)
            arrowImageView.setupColor(color: .white)
            
            // shadows
            self.layer.shadowColor = #colorLiteral(red: 0.5647058824, green: 0.07843137255, blue: 0.9333333333, alpha: 1).cgColor
            self.layer.shadowRadius = 6
            self.layer.shadowOpacity = 0.7
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
        default:
        break
        }
    }
    
    func setDirection() {
        switch direction {
        case .left:
            arrowImageView.image = #imageLiteral(resourceName: "arrow_forward - material")
            
        case .right:
            arrowImageView.image = #imageLiteral(resourceName: "arrow_forward")
            
        default:
            break
        }
    }
    
    func setSize() {
        switch size {
        case .large:
            arrowInsert = 24
        case .medium:
            arrowInsert = 17
        case .small:
            break
        default:
            break
        }
    }
    
    func setupArrow() {
        if size != .small, direction != .noArrow {
            if direction == .left {
                self.addSubview(arrowImageView)
                arrowImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: arrowInsert!).isActive = true
                arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            }
            if direction == .right {
                self.addSubview(arrowImageView)
                arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -arrowInsert!).isActive = true
                arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            }
        }
        if size == .small {
            self.addSubview(arrowImageView)
            arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            arrowImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    init(title: String,
//                     titleColor: UIColor,
//                     backgroundColor: UIColor,
//                     font: UIFont? = UIFont.init(name: "Helvetica", size: 16),
//                     isClear: Bool = false,
//                     cornerRadius: CGFloat = 25) {
//        self.init(type: .system)
//
//        self.setTitle(title, for: .normal)
//        self.setTitleColor(titleColor, for: .normal)
//        self.backgroundColor = backgroundColor
//        self.titleLabel?.font = font
//
//        self.layer.cornerRadius = cornerRadius
//
//
//        if isClear || backgroundColor == .clear {
//            layer.borderColor = titleColor.cgColor
//            layer.borderWidth = 1
//        } else {
//            self.layer.shadowColor = UIColor.black.cgColor
//            self.layer.shadowRadius = 4
//            self.layer.shadowOpacity = 0.2
//            self.layer.shadowOffset = CGSize(width: 0, height: 4)
//        }
//
//        let arrowLogo = UIImageView(image: #imageLiteral(resourceName: "arrow_forward - material"), contentMode: .scaleAspectFit)
//        arrowLogo.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(arrowLogo)
//        arrowLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
//        arrowLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//    }
}
