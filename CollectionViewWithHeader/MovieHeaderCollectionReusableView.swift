//
//  MovieHeaderCollectionReusableView.swift
//  CollectionViewWithHeader
//
//  Created by PGK Shiva Kumar on 17/07/21.
//

import UIKit

class MovieHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var headerLabelOutlet: UILabel!
    
    func setupUI(header : String){
        headerLabelOutlet.text = header
    }
    func configUI(titles:String?, Header:Bool){
        headerLabelOutlet.text = titles
        topView.backgroundColor = Header ? UIColor.red : UIColor.blue
    }
}
