//
//  ViewController.swift
//  GweilandApp
//
//  Created by Jonnadula Pavan Kalyan  on 15/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var walletTab: UIView!
    @IBOutlet weak var launchPadTab: UIView!
    @IBOutlet weak var exchangeTab: UIView!
    @IBOutlet weak var eShopTab: UIView!
   
    @IBOutlet weak var shopContainerView: UIView!
    @IBOutlet weak var walletContainerView: UIView!
    @IBOutlet weak var exchangeContainerView: UIView!
    @IBOutlet weak var launchContainerView: UIView!
    
    @IBOutlet weak var eshopTextBtn: UIButton!
    @IBOutlet weak var eshopImageBtn: UIButton!

    @IBOutlet weak var exchangeTextBtn: UIButton!
    @IBOutlet weak var exchangeImageBtn: UIButton!
    
    @IBOutlet weak var launchTextBtn: UIButton!
    @IBOutlet weak var launchImageBtn: UIButton!

    @IBOutlet weak var walletTextBtn: UIButton!
    @IBOutlet weak var walletImageBtn: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
    }
    
    func initialView(){
        eshopTextBtn.tintColor = UIColor.white
        eshopImageBtn.tintColor = UIColor.white
        exchangeTextBtn.tintColor = UIColor.lightGray
        exchangeImageBtn.tintColor = UIColor.lightGray
        launchTextBtn.tintColor = UIColor.lightGray
        launchImageBtn.tintColor = UIColor.lightGray
        
        walletTextBtn.tintColor = UIColor.lightGray
        walletImageBtn.tintColor = UIColor.lightGray
        
        shopContainerView.isHidden = false
        walletContainerView.isHidden = true
        exchangeContainerView.isHidden = true
        launchContainerView.isHidden = true
        
        walletTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(walletTabSelected)))
        exchangeTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(exchangeTabSelected)))
        launchPadTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(launchTabSelected)))
        eShopTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(shopTabSelected)))
    }
    
    @objc func walletTabSelected(){
        shopContainerView.isHidden = true
        walletContainerView.isHidden = false
        exchangeContainerView.isHidden = true
        launchContainerView.isHidden = true
        
        eshopTextBtn.tintColor = UIColor.lightGray
        eshopImageBtn.tintColor = UIColor.lightGray
        exchangeTextBtn.tintColor = UIColor.lightGray
        exchangeImageBtn.tintColor = UIColor.lightGray
        launchTextBtn.tintColor = UIColor.lightGray
        launchImageBtn.tintColor = UIColor.lightGray
        walletTextBtn.tintColor = UIColor.white
        walletImageBtn.tintColor = UIColor.white
        
    }
    
    @objc func exchangeTabSelected(){
        shopContainerView.isHidden = true
        walletContainerView.isHidden = true
        exchangeContainerView.isHidden = false
        launchContainerView.isHidden = true
        
        eshopTextBtn.tintColor = UIColor.lightGray
        eshopImageBtn.tintColor = UIColor.lightGray
        exchangeTextBtn.tintColor = UIColor.white
        exchangeImageBtn.tintColor = UIColor.white
        launchTextBtn.tintColor = UIColor.lightGray
        launchImageBtn.tintColor = UIColor.lightGray
        
        walletTextBtn.tintColor = UIColor.lightGray
        walletImageBtn.tintColor = UIColor.lightGray
        
    }

    @objc func launchTabSelected(){
        shopContainerView.isHidden = true
        walletContainerView.isHidden = true
        exchangeContainerView.isHidden = true
        launchContainerView.isHidden = false
        
        eshopTextBtn.tintColor = UIColor.lightGray
        eshopImageBtn.tintColor = UIColor.lightGray
        exchangeTextBtn.tintColor = UIColor.lightGray
        exchangeImageBtn.tintColor = UIColor.lightGray
        launchTextBtn.tintColor = UIColor.white
        launchImageBtn.tintColor = UIColor.white
        
        walletTextBtn.tintColor = UIColor.lightGray
        walletImageBtn.tintColor = UIColor.lightGray
        
    }
    
    @objc func shopTabSelected(){
        shopContainerView.isHidden = false
        walletContainerView.isHidden = true
        exchangeContainerView.isHidden = true
        launchContainerView.isHidden = true
        
        eshopTextBtn.tintColor = UIColor.white
        eshopImageBtn.tintColor = UIColor.white
        exchangeTextBtn.tintColor = UIColor.lightGray
        exchangeImageBtn.tintColor = UIColor.lightGray
        launchTextBtn.tintColor = UIColor.lightGray
        launchImageBtn.tintColor = UIColor.lightGray
        
        walletTextBtn.tintColor = UIColor.lightGray
        walletImageBtn.tintColor = UIColor.lightGray
        
    }

}

