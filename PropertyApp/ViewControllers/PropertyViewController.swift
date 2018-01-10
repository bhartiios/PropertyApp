//
//  PropertyViewController.swift
//  PropertyApp
//
//  Created by Bharti Sharma on 08/01/18.
//  Copyright © 2018 Bharti Sharma. All rights reserved.
//

import UIKit

protocol PropertySelectionDelegate: class {
    func propertySelected(property: Property) 
}

class PropertyViewController: UITableViewController, PropertyApiManager {

    var arrProperty = [Property]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension

        callWebserviceForProperties()
    }
    weak var delegate:PropertySelectionDelegate?
    
    //MARK:- Custom Methods
    
    func callWebserviceForProperties(){
        showLoader()
        self.getPropertyList(completionHandler: { (arrProp) in
            self.arrProperty = arrProp
            self.arrProperty.sort{ $0.isPremium && !$1.isPremium }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.hideLoader()
            }
        }) { (error) in
            self.hideLoader()
            print("Error is \(error.debugDescription)")
        }
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProperty.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PropertyTableViewCell else{
            return UITableViewCell()
        }
        let property = arrProperty[indexPath.row]
        cell.selectionStyle = .none
        cell.property = property
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedProperty = arrProperty[indexPath.row]
        delegate?.propertySelected(property: selectedProperty)
        if let detailViewController = delegate as? PropertyDetailViewController {
            detailViewController.property = selectedProperty
            splitViewController?.showDetailViewController(detailViewController.navigationController!, sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
