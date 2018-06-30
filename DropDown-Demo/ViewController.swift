//
//  ViewController.swift
//  DropDown-Demo
//
//  Created by sushant jagtap on 16/06/18.
//  Copyright © 2018 Creative Corner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dropDownTextfield: UITextField!
    let dataArr = [" ", "Mr.", "Ms.", "Mrs."]
    let zoomImage = UIImage(named: "down arrow")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dropDownTextfield.rightViewMode = .always
        let dropDownImage = UIImageView(frame: CGRect(x: 5, y: 5, width: 20, height: 20))
        dropDownImage.image = UIImage(named: "down arrow")
        dropDownTextfield.rightView = dropDownImage
        
        dropDownTextfield.loadDropdownData(data: dataArr)
        
    }

    @IBAction func showZoomPhotoPressed(_ sender: UIButton) {
        let zoomView = ZoomPhotoView()
        zoomView.presentZoomPhotoView(photo: zoomImage!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnpresentclicked(_ sender: UIButton) {
        
        let blurVC = BlurViewController(nibName: "BlurViewController", bundle: nil)
        blurVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        present(blurVC, animated: true, completion: nil)
//        blurVC.presentBlurView(controller: self)
    }
    
}


extension UITextField {
    func loadDropdownData(data : [String]) {
       self.inputView = MyPickerView(pickerData: data, dropDownField: self)
    }
}
