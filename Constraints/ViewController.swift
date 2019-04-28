//
//  ViewController.swift
//  Constraints
//
//  Created by Manu Singh on 28/04/19.
//  Copyright © 2019 Manu Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigationBar()
        let centerView = setCenterView()
        addCenterViewBottom(centerView: centerView)
        
    }
    
    func setNavigationBar(){
        let backButton = UIButton()
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = UIColor.magenta
        view.addSubview(backButton)
        backButton.leadingEqual(to: self.view)
        backButton.topEqual(to: self.view).setConstant(20)
        backButton.heightEqual(to: 44)
        backButton.widthEqual(to: 44)
    }
    
    func setCenterView()->UIView{
        let centerView = UIView()
        centerView.backgroundColor = UIColor.blue
        view.addSubview(centerView)
        centerView.centerXEqual(to: self.view)
        centerView.centerYEqual(to: self.view)
        centerView.widthEqual(to: self.view)
        centerView.aspectRatio(equal: 1)
        return centerView
    }
    
    func addCenterViewBottom(centerView : UIView){
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.red
        view.addSubview(bottomView)
        bottomView.constraint(property: .top, equal: .bottom, to: centerView)
        bottomView.widthAndPositionEqual(to: centerView)
        bottomView.heightEqual(to: 44)
        
    }


}

