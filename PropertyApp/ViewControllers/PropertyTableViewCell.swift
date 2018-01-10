//
//  PropertyTableViewCell.swift
//  PropertyApp
//
//  Created by Bharti Sharma on 09/01/18.
//  Copyright © 2018 Bharti Sharma. All rights reserved.
//

import UIKit
import SDWebImage

class PropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var imgVwIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOwnerName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblBedrooms: UILabel!
    @IBOutlet weak var lblBathrooms: UILabel!
    @IBOutlet weak var lblCarspots: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPremium: UILabel!
    @IBOutlet weak var imgVwPremiumIcon: UIImageView!
    
    var property:Property?{
        didSet{
            imgVwIcon.sd_setImage(with: URL(string:(property?.avatarUrl)!), placeholderImage: UIImage(named:"home"), options: SDWebImageOptions.highPriority, completed: nil)
        
            lblTitle.text = property?.title
            lblOwnerName.text = (property?.ownerFirstName)! + " " + (property?.ownerLastName)!
            lblPrice.text = "Price: $\(property?.price ?? 0.0)"
            lblBedrooms.text = "Bedrooms: \(property?.bedrooms ?? 0)"
            lblBathrooms.text = "Bathrooms: \(property?.bathrooms ?? 0)"
            lblCarspots.text = "Carspots: \(property?.carspots ?? 0)"
            
            guard let add1 = property?.address1, let add2 = property?.address2 , let suburb = property?.suburb, let zip = property?.postcode else {
                return
            }
            
            lblAddress.text = add1 + "\n" + add2 + " " + suburb + " " + zip
            
            if let premium = property?.isPremium{
                imgVwPremiumIcon.isHidden = premium == true ? false : true
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
