//
//  Constraints+UIViewExtensions.swift
//  Constraints
//
//  Created by Manu Singh on 28/04/19.
//  Copyright © 2019 Manu Singh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @discardableResult func addConstraint(property : NSLayoutConstraint.Attribute, to view : UIView)->NSLayoutConstraint{
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: property, relatedBy: .equal, toItem: view, attribute: property, multiplier: 1, constant: 0)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func addConstraint(property : NSLayoutConstraint.Attribute,equal constant : CGFloat)->NSLayoutConstraint{
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: property, relatedBy: .equal, toItem: nil, attribute: property, multiplier: 1, constant: constant)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func addConstraint(property : NSLayoutConstraint.Attribute,equal another : NSLayoutConstraint.Attribute,ratio : CGFloat)->NSLayoutConstraint{
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: property, relatedBy: .equal, toItem: self, attribute: another, multiplier: ratio, constant: 0)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult func addConstraint(property : NSLayoutConstraint.Attribute,equal another : NSLayoutConstraint.Attribute,to view : UIView)->NSLayoutConstraint{
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = NSLayoutConstraint(item: self, attribute: property, relatedBy: .equal, toItem: view, attribute: another, multiplier: 1, constant: 0)
        constraint.isActive = true
        return constraint
    }
    
    func sizeAndPositionEqual(to view : UIView){
        widthAndPositionEqual(to: view)
        heightAndPositionEqual(to: view)
    }
    
    func widthAndPositionEqual(to view : UIView){
        addConstraint(property: .leading, to: view)
        addConstraint(property: .trailing, to: view)
    }
    
    func heightAndPositionEqual(to view : UIView){
        addConstraint(property: .top, to: view)
        addConstraint(property: .bottom, to: view)
    }
    
    @discardableResult func widthEqual(to view : UIView)->NSLayoutConstraint{
        return addConstraint(property: .width, to: view)
    }
    
    @discardableResult func heightEqual(to view : UIView)->NSLayoutConstraint{
        return addConstraint(property: .height, to: view)
    }
    
    @discardableResult func topEqual(to view : UIView)->NSLayoutConstraint {
        return addConstraint(property: .top, to: view)
    }
    
    @discardableResult func bottomEqual(to view : UIView)->NSLayoutConstraint {
        return addConstraint(property: .bottom, to: view)
    }
    
    @discardableResult func leadingEqual(to view : UIView)->NSLayoutConstraint {
        return addConstraint(property: .leading, to: view)
    }
    
    @discardableResult func trailingEqual(to view : UIView)->NSLayoutConstraint {
        return addConstraint(property: .trailing, to: view)
    }
    
    @discardableResult func centerYEqual(to view : UIView)->NSLayoutConstraint{
        return addConstraint(property: .centerY,to : view)
    }
    
    @discardableResult func centerXEqual(to view : UIView)->NSLayoutConstraint{
        return addConstraint(property: .centerX,to : view)
    }
    
    @discardableResult func heightEqual(to constant : CGFloat)->NSLayoutConstraint {
        return addConstraint(property:.height,equal: constant)
    }

    @discardableResult func widthEqual(to constant : CGFloat)->NSLayoutConstraint {
        return addConstraint(property:.width,equal: constant)
    }
    
    @discardableResult func aspectRatio(equal constant : CGFloat)->NSLayoutConstraint {
        return addConstraint(property:.width,equal: .height,ratio: constant)
    }
    
    @discardableResult func constraint(property : NSLayoutConstraint.Attribute ,equal another : NSLayoutConstraint.Attribute, to view : UIView)->NSLayoutConstraint {
        return addConstraint(property:property,equal: another,to: view)
    }
    
}

extension NSLayoutConstraint {
    
    func setConstant(_ constant : CGFloat) {
        self.constant = constant
    }
    
    func setPriority(_ priority : Float){
        self.priority = UILayoutPriority(priority)
    }
    
    func remove(){
        self.isActive = false
    }
}

extension UIView {
    
    func removeAllConstraints(){
        self.removeConstraints(self.constraints)
    }
}
