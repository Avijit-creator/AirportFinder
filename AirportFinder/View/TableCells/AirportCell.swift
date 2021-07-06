//
//  AirportCell.swift
//  AirportFinder
//
//  Created by 1975776 on 02/07/21.
//

import UIKit

class AirportCell: UITableViewCell {

    @IBOutlet weak var runawayLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var airportNameLbl: UILabel!
    
    var obj : AirportModel? {
        didSet {
            self.airportNameLbl.text = obj?.name ?? ""
            self.runawayLbl.text = obj?.runwayLength ?? ""
            self.countryLbl.text = obj?.country ?? ""
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
