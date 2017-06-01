//
//  GVCircularMenuView+ViewSetup.swift
//  GVCircularMenu
//
//  Created by Gabriel Bezerra Valério on 31/05/17.
//  Copyright © 2017 bepiducb. All rights reserved.
//

import UIKit

extension GVCircularMenuView {
    
    func viewSetup(){
        createExternalCircle()
        createCenter()
    }
    
    func createCenter(){
        let width = frame.width * dataSource.proportionForCenterCircle(in: self)
        centerCircle = UIView(frame: CGRect(x: (frame.width - width) / 2, y: (frame.height - width) / 2, width: width, height: width))
        //centerCircle.center = center
        centerCircle.layer.cornerRadius = width / 2 //sets it circular
        
        let iconSide = centerCircle.frame.width / 2
        centerCircleIcon = UIImageView(frame: CGRect(x: iconSide/2, y: iconSide/2, width: iconSide, height: iconSide))
        centerCircleIcon.contentMode = .scaleAspectFit
        
        self.addSubview(centerCircle)
    }
    
    func createExternalCircle() {
        externalCircle = GVCircularMenuExternalCircle(frame: CGRect(origin: .zero, size: frame.size), dataSource: dataSource, parent: self)
        
        rotationAngle += CGFloat(Double.pi / Double(externalCircle.buttons.count))
        externalCircle.transform = CGAffineTransform(rotationAngle: rotationAngle)
        externalCircle.buttons[activeButtonIndex].iconView.image = dataSource.circularMenu(self, activeImageForButtonIndex: activeButtonIndex)
        
        self.addSubview(externalCircle)
    }
}
