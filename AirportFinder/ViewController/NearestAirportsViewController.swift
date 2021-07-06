//
//  NearestAirportsViewController.swift
//  AirportFinder
//
//  Created by Avijit on 02/07/21.
//

import UIKit

class NearestAirportsViewController: UIViewController {
    
    //-----------------------------------------------------------------------
    // MARK:- IBOUTLETS
    //-----------------------------------------------------------------------
    @IBOutlet weak var airportTableView: UITableView!
    
    //-----------------------------------------------------------------------
    // MARK:- Private Properties
    //-----------------------------------------------------------------------
   private var modelData : [AirportModel] = []
    
    //-----------------------------------------------------------------------
    // MARK:- Public Properties
    //-----------------------------------------------------------------------
   public var viewModel: NearestAirportsViewModelType!
    
    //-----------------------------------------------------------------------
    // MARK:- View Life Cycle Methods
    //-----------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    //-----------------------------------------------------------------------
    // MARK:- Setup Initial View
    //-----------------------------------------------------------------------
   private func initializeView() {
        Loader.sharedManager.showLoaderOnParticularView(view: self.view)
        DispatchQueue.global(qos: .userInitiated).async {
            self.modelData = self.viewModel.findNearestAirports(selectedCity: self.viewModel.selectedCityModel)
            DispatchQueue.main.async {
                self.airportTableView.reloadData()
                Loader.sharedManager.stopAnimatingLoader()
            }
        }
    }
    
}
//-----------------------------------------------------------------------
//MARK:- Table Datasource
//-----------------------------------------------------------------------
extension NearestAirportsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if modelData.count < 5 {
            return modelData.count
        } else {
            return 5
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"AirportCell") as! AirportCell
        cell.obj = self.modelData[indexPath.row]
        return cell
    }
    
    
}




