//
//  ZoomPhotoView.swift
//  DropDown-Demo
//
//  Created by sushant jagtap on 16/06/18.
//  Copyright © 2018 Creative Corner. All rights reserved.
//

import Foundation
import UIKit

class ZoomPhotoView: NSObject {
    
    let blurBackgroundView = UIView()
    let zoomImageView = UIImageView()
    
    override init() {
        super.init()
    }
    
    public func presentZoomPhotoView(photo: UIImage) {
        if let window = UIApplication.shared.keyWindow {
            blurBackgroundView.frame = window.frame
            blurBackgroundView.isUserInteractionEnabled = true
            blurBackgroundView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blurBackgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dissmissZoomPhotoView)))
            
            zoomImageView.frame = CGRect(x: window.frame.origin.x + 50, y: -window.frame.size.height, width: window.frame.size.width - 100, height: window.frame.size.height - 160)
            zoomImageView.image = photo
            
            window.addSubview(blurBackgroundView)
            window.addSubview(zoomImageView)
            
            weak var weakSelf = self
            UIView.animate(withDuration: 0.5, animations: {
                weakSelf?.blurBackgroundView.alpha = 1
                weakSelf?.zoomImageView.frame.origin.y = window.frame.origin.y + 80
            })
        }
    }
    
    @objc public func dissmissZoomPhotoView() {
        weak var weakSelf = self
        UIView.animate(withDuration: 0.5) {
            weakSelf?.blurBackgroundView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                weakSelf?.zoomImageView.frame.origin.y = window.frame.height
            }
        }
    }
    
}



