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
    
    
    var pData = [ParkingData]()
    var bData = [Bargainings]()
    var parkingApiResponse:ApiResponseMultipleData<ParkingData>?
    var bargainingApiResponse:ResponseDataArray<Bargainings>?
    
    @IBOutlet weak var weatherTbl: UITableView!
    @IBOutlet weak var locatiobLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerCell()
        
        //Get Bargainings
        getBargainings()
        
    }
    
    func registerCell(){
        
        weatherTbl.tableFooterView = UIView()
        weatherTbl.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
    }
    
    
    func getBargainings(){
        
        let params:[String:Any]  = [ : ]
        
        Alamofire.request(APIRouter.bargainings(params)).responseAPIRes { response in
            
            switch response.result {
                case .success:
                    
                    if response.result.value?.success ?? false {
                        
                        if let bData = response.result.value?.data {
                            //                print("bData=\(bData)")
                            self.bData = bData
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
        
        return bData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = weatherTbl.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
        //        let cell = weatherTbl.dequeueReusableCell(withIdentifier: "WeatherCell")!
        
        cell.setData(day: bData[indexPath.row].statusText ?? "-", condition: bData[indexPath.row].statusText ?? "-", temp: bData[indexPath.row].id ?? 0 )
        
        return  cell;
    }
    
    
}




