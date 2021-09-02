//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Arda on 24.08.2021.
//

import UIKit
import SVProgressHUD
import RxSwift
import RxCocoa
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRockets()
    }

    func getRockets() {
        ApiClient.shared.listRockets().observe(onStart: {
            SVProgressHUD.show()
        }, onEnd: {
            SVProgressHUD.dismiss()
        }, onSuccess: { (result) in
            
            result.forEach({ (list) in
                print(list)
                RocketArray.append((rocket_id: list.rocket.rocket_id!, rocket_name: list.rocket.rocket_name!, rocket_type: list.rocket.rocket_type ?? "Not Found", mission_name: list.mission_name ?? "Not Found", launch_year: list.launch_year ?? "Not Found", mission_patch: list.links.mission_patch ?? "Not Found", details: list.details ?? "Not Found", list.links.flickr_images))
            })
            self.tableViewSource()

            
        }) { (erorr) in
            print(erorr)
        }
    }

    func tableViewSource() {
        let items = Observable.just(
            (0..<RocketArray.count).map { "\($0)" }
        )
        
        items
            .bind(to: tableView.rx.items(cellIdentifier: "RocketCell", cellType: RocketCell.self)) { (row, element, cell) in
                   
                cell.missionName?.text = RocketArray[row].mission_name
                if RocketArray[row].mission_patch != "" {
                cell.rocketImage.kf.setImage(with: URL(string: RocketArray[row].mission_patch))
            }
        }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(String.self)
            .subscribe(onNext:  { value in
                let detailVC = self.storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
                detailVC.modalPresentationStyle = .pageSheet
                detailVC.imageMissionURL = RocketArray[Int(value)!].mission_patch
//                detailVC.nameRocket = RocketArray[Int(value)!].rocket_name
                detailVC.titleArray.append(RocketArray[Int(value)!].details)
                detailVC.titleArray.append(RocketArray[Int(value)!].launch_year)
                detailVC.titleArray.append(RocketArray[Int(value)!].mission_name)
                detailVC.descArray = (RocketArray[Int(value)!].flickr_images)
                self.navigationController!.pushViewController(detailVC, animated: true)
                //descarraya collection fotolarını at
            })
            .disposed(by: disposeBag)
    }
}

