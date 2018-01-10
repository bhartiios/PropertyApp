//
//  PropertyDetailViewController.swift
//  PropertyApp
//
//  Created by Bharti Sharma on 09/01/18.
//  Copyright © 2018 Bharti Sharma. All rights reserved.
//

import UIKit

class PropertyDetailViewController: UIViewController {

    @IBOutlet weak var lblID: UILabel!
    var property: Property?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - Custom Methods
    
    func fillData(){
        guard let property = property else{
            return
        }
        lblID.text = "\(property.description)"
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

extension PropertyDetailViewController: PropertySelectionDelegate {
    func propertySelected(property: Property)  {
        self.property = property
    }
}
