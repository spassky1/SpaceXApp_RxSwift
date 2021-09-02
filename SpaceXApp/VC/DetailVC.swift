//
//  DetailVC.swift
//  SpaceXApp
//
//  Created by Arda on 25.08.2021.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class DetailVC: UIViewController , UITableViewDelegate {
    
    var descArray = [String]() //collection resimleri burada tutulacak
    var disposeBag = DisposeBag()
    var nameRocket = String()
    var titleArray = [String]()
    var imageMissionURL: String!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var detailsText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var imageMission: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = nameRocket
        collectionSource()
        tableViewSource()
    }
    
    func collectionSource(){

            let items = Observable.just(
                (0..<descArray.count).map { "\($0)" }
            )

            items
                .bind(to: collectionView.rx.items(cellIdentifier: "CollectionCell", cellType: CollectionCell.self)) { (row, element, cell) in
                    
                    if RocketArray[row].mission_patch != "" {
                    cell.rocketImage.kf.setImage(with: URL(string: self.descArray[row]))
                    }
                }
                .disposed(by: disposeBag)
        }
    
    func tableViewSource(){
        detailsText.text = titleArray[0]
        detailsText.numberOfLines = 0
        dateText.text = titleArray[1]
        imageMission.kf.setImage(with: URL(string: self.imageMissionURL))
        
        }
}
