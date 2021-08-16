//
//  ViewController.swift
//  CollectionViewWithHeader
//
//  Created by PGK Shiva Kumar on 17/07/21.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let sreeenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    @IBOutlet weak var movieCVOutlet : UICollectionView!

    @IBOutlet weak var imagesCVOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies ()
        setupUI()
    }
    var movielist : [MovieDataModel] = []
    
    func getMovies () {
        movielist = [MovieDataModel(headre: "The Classics", movies: ["NoPath - Copy (2)","NoPath - Copy (3)","NoPath - Copy (4)","NoPath - Copy (5)"]),
                     MovieDataModel(headre: "Fuller House", movies: ["NoPath - Copy (122)","NoPath - Copy (123)","NoPath - Copy (124)","NoPath - Copy (125)"]),
                     MovieDataModel(headre: "The Boss Baby : Back in Business", movies: ["NoPath - Copy (130)","NoPath - Copy (127)","NoPath - Copy (128)","NoPath - Copy (131)"]),
                     MovieDataModel(headre: "Bridgerton", movies: ["NoPath - Copy (137)","NoPath - Copy (140)","NoPath - Copy (141)","NoPath - Copy (135)"])]
    }
    func setupUI(){
        movieCVOutlet.dataSource = self
        movieCVOutlet.delegate = self
        movieCVOutlet.reloadData()
    }

}
extension ViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return movielist.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movielist[section].movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell{
            cell.setupUI(movieImage: String(movielist[indexPath.section].movies[indexPath.row]))
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            if let header = movieCVOutlet.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MovieHeaderCollectionReusableView", for: indexPath) as? MovieHeaderCollectionReusableView{
                header.configUI(titles: String(movielist[indexPath.section].headre), Header: true)
                return header
            }
        }
        return UICollectionReusableView()
    }
}
extension ViewController : UICollectionViewDelegate{
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: screenWidth, height: 30)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: screenWidth, height: 30)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
