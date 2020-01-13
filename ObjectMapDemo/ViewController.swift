//
//  ViewController.swift
//  ObjectMapDemo
//
//  Created by Apple on 08/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import UIKit
import Alamofire




class ViewController: UIViewController {
    
    
    var pData = [Parkings]()
    var bData = [Bargainings]()
    var parkingApiResponse:ResponseDataArray<Parkings>?
    var bargainingApiResponse:ResponseDataArray<Bargainings>?
    
    @IBOutlet weak var weatherTbl: UITableView!
    @IBOutlet weak var locatiobLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerCell()
        
        //Get Bargainings
//        getBargainings()
        
        //Get Parkings
        getParkings()
        
    }
    
    func registerCell(){
        
        weatherTbl.tableFooterView = UIView()
        weatherTbl.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
    }
    
    func getParkings(){

        let params:[String:Any]  = [ : ]

        Alamofire.request(APIRouter.parkings(params)).parkingRes { response in

            switch response.result {
            case .success:

                if response.result.value?.success ?? false {

                    if let val = response.result.value?.data {
                        //                print("bData=\(bData)")
                        self.pData = val
                        self.weatherTbl.reloadData()
                    }

                }
                else{
                    print("Server Message=\(response.result.value?.message ?? "-" )")

                }

            case .failure(let error):
                print("ERROR==\(error)")
            }
        }
    }

    
    func getBargainings(){
        
        let params:[String:Any]  = [ : ]
        
        Alamofire.request(APIRouter.bargainings(params)).bargainingRes{ response in
            
            switch response.result {
                case .success:
                    
                    if response.result.value?.success ?? false {
                        
                        if let val = response.result.value?.data {
                            //                print("bData=\(bData)")
                            self.bData = val
                            self.weatherTbl.reloadData()
                        }
                        
                    }
                    else{
                        print("Server Message=\(response.result.value?.message ?? "-" )")
                        
                    }
                
                case .failure(let error):
                print("ERROR==\(error)")
            }
        }
    }
    
    
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = weatherTbl.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
        //        let cell = weatherTbl.dequeueReusableCell(withIdentifier: "WeatherCell")!
        
        cell.setData(day: pData[indexPath.row].parkingTypeText ?? Nulls.nullString, condition: pData[indexPath.row].parkingTypeText ?? Nulls.nullString, temp: pData[indexPath.row].parkingExtraFee ?? Nulls.nullInt)
        
        return  cell;
    }
    
    
}




