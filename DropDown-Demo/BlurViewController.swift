//
//  BlurViewController.swift
//  DropDown-Demo
//
//  Created by sushant jagtap on 17/06/18.
//  Copyright © 2018 Creative Corner. All rights reserved.
//

import UIKit

class BlurViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.modalPresentationStyle=UIModalPresentationStyle.overCurrentContext

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentBlurView(controller: UIViewController) {
        
        self.modalPresentationStyle=UIModalPresentationStyle.overCurrentContext
        controller.present(self, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
