//
//  CityCell.swift
//  AirportFinder
//
//  Created by 1975776 on 02/07/21.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var cityLbl: UILabel!
    var viewModel :  AirportModel? {
        didSet {
            self.cityLbl.text = self.viewModel?.city
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

