//
//  Loader.swift
//  AirportFinder
//
//  Created by Avijit on 02/07/21.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class Loader: UIViewController {

    static let  sharedManager = Loader()
    var  activityIndicator = NVActivityIndicatorView.init(frame: CGRect.zero)
    
    //14,29,31,23,30
    func startAnimatingLoader(){//Loading..
        activityIndicator.startAnimating()
        
        
    }
    func stopAnimatingLoader() {
        activityIndicator.stopAnimating()
    }
    
    //-----------------------------------------------------------------------
    //MARK:- Show loader on particular View -
    //-----------------------------------------------------------------------
    
    func showCameraLoader(view: UIView) {
        let frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = . cubeTransition // add your type
        activityIndicator.color = UIColor.black // add your color
        
        view.addSubview(activityIndicator) // or use  webView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func showLoaderOnParticularView(view: UIView) {
        let frame = CGRect(x: view.frame.width/2 - 25, y: view.frame.height/2 - 25, width: 50, height: 50)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = .circleStrokeSpin // add your type
        activityIndicator.color = UIColor.black // add your color
        
        view.addSubview(activityIndicator) // or use  webView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func showLoaderOnLoadMore(view: UIView,height: CGFloat = 50.0, haveTabbar: Bool = false) {
        if activityIndicator.frame == CGRect.zero {
            var frame: CGRect = CGRect.zero
            if haveTabbar {
                frame = CGRect(x: (view.frame.width / 2) - 15, y: view.frame.height - 105, width: height, height: height)
            }else{
               frame = CGRect(x: (view.frame.width / 2) - 15, y: view.frame.height - height, width: height, height: height)
            }
            activityIndicator = NVActivityIndicatorView(frame: frame)
            activityIndicator.type = .ballClipRotateMultiple // add your type
            activityIndicator.color = UIColor.darkGray//Common.sharedInstance.hexStringToUIColor(hex: colorCode.introviewLoaderColor) // add your color
            activityIndicator.removeFromSuperview()
           // view.addSubview(UIView.init(frame: CGRect.zero))
            view.insertSubview(activityIndicator, at: view.subviews.count)
            activityIndicator.startAnimating()
        }
    }
    func hideLoaderOnParticularView() {
        if activityIndicator.frame != CGRect.zero {
            activityIndicator.frame = CGRect.zero
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

