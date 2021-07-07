//
//  SearchCityViewController.swift
//  AirportFinder
//
//  Created by Avijit on 02/07/21.
//

import UIKit

class SearchCityViewController: UIViewController {
    //-----------------------------------------------------------------------
    // MARK:- IBOUTLETS
    //-----------------------------------------------------------------------
    @IBOutlet weak var searchTxtField: UITextField! {
        didSet {
            self.searchTxtField.layer.cornerRadius = 10
            self.searchTxtField.layer.masksToBounds = true
            self.searchTxtField.layer.borderWidth = 1
            self.searchTxtField.layer.borderColor = UIColor.gray.cgColor
            self.searchTxtField.setLeftPadding(padding:20)
        }
    }
    @IBOutlet weak var listingTableView: UITableView! {
        didSet {
            self.listingTableView.contentInset = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0)
        }
    }
    
    //-----------------------------------------------------------------------
    // MARK:- Private Properties
    //-----------------------------------------------------------------------
   private var viewModel = SearchCityViewModel()
    
    //-----------------------------------------------------------------------
    // MARK:- View Life Cycle Methods
    //-----------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        getListData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.searchTxtField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                                 for: UIControl.Event.editingChanged)
    }

    //-----------------------------------------------------------------------
    // MARK:- Fetch City list from API
    //-----------------------------------------------------------------------
     private func getListData() {
        Loader.sharedManager.showLoaderOnParticularView(view: self.view)
        self.viewModel.calledListingDetailApi { status in
            if status {
                Loader.sharedManager.stopAnimatingLoader()
            }

        }
    }

}
//-----------------------------------------------------------------------
//MARK:- Table Delegate & Datasource
//-----------------------------------------------------------------------
extension SearchCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return   self.viewModel.searchCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CityCell") as! CityCell
        cell.viewModel = self.viewModel.searchIndexData(index: indexPath.row)
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        let nearestViewcontroller = story.instantiateViewController(identifier:"NearestAirportsViewController") as! NearestAirportsViewController
        nearestViewcontroller.viewModel = NearestAirportsViewModel(selectedCityModel: self.viewModel.searchResultArr[indexPath.row], airportArray: self.viewModel.filterAiportData(inputArr: self.viewModel.arrayListJson))
        self.navigationController?.pushViewController(nearestViewcontroller, animated:true)
        
    }
    
}
//-----------------------------------------------------------------------
// MARK:- Search and Textfield delegate
//-----------------------------------------------------------------------
extension SearchCityViewController: UITextFieldDelegate {
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
     // filter tableViewData with textField.text
        let searchText  = textField.text ?? ""
        self.viewModel.searchListMethod(searchText: searchText) { status in
            debugPrint("search completes")
        }
        DispatchQueue.main.async {
            self.listingTableView.reloadData()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    
}

