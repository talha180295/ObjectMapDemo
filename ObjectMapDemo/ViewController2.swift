////
////  ViewController2.swift
////  ObjectMapDemo
////
////  Created by Apple on 08/01/2020.
////  Copyright © 2020 Talha. All rights reserved.
////
//
//import UIKit
//import Alamofire
//
//
//
//
//class ViewController2: UIViewController {
//    
//    
//    var pData = [ParkingData]()
//    var bData = [Bargainings]()
//    var parkingApiResponse:ApiResponseMultipleData<ParkingData>?
//    var bargainingApiResponse:ResponseDataArray<Bargainings>?
//    
//    @IBOutlet weak var weatherTbl: UITableView!
//    @IBOutlet weak var locatiobLabel: UILabel!
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        
//        
//        registerCell()
//        
//        
//        //        getPArkingsByID(id: 14)
//        
//        
//        //        getParkings(){
//        //
//        //            if let val = self.parkingApiResponse?.data {
//        //
//        //                print("valcount===\(val.count)")
//        //                self.pData = val
//        //                self.weatherTbl.reloadData()
//        //
//        //            }
//        //        }
//        
//        //        getBargainings {
//        //
//        //            if let val = self.bargainingApiResponse?.data {
//        //
//        //                print("valcount===\(val.count)")
//        //                self.bData = val
//        //                self.weatherTbl.reloadData()
//        //
//        //            }
//        //        }
//        
//        //        Alamofire.request(APIRouter.bargainings([:])).responseAPIRes { response in
//        //
//        ////            response.data
//        //
//        //         if let bData = response.result.value?.data {
//        //           print("bData=\(bData)")
//        //            self.bData = bData
//        //            self.weatherTbl.reloadData()
//        //         }
//        //        }
//        
//        
//        
//        //        APIClient.getData {
//        //
//        //            if let val = self.bargainingApiResponse?.data {
//        //
//        //                print("valcount===\(val.count)")
//        //                self.bData = val
//        //                self.weatherTbl.reloadData()
//        //
//        //            }
//        //        }
//        //
//        
//        Alamofire.request(APIRouter.bargainings([:])).responseAPIRes { response in
//            
//            if let bData = response.result.value?.data {
//                //                print("bData=\(bData)")
//                self.bData = bData
//                self.weatherTbl.reloadData()
//            }
//        }
//    }
//    
//    func registerCell(){
//        
//        weatherTbl.tableFooterView = UIView()
//        weatherTbl.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
//    }
//    
//    
//    func getBargainings(completion:@escaping ()->Void){
//        
//        let params:[String:Any]  = [ : ]
//        APIClient.getDataRequest(url: APIRouter.bargainings(params)) { (response) in
//            
//            //            print(response)
//            
//            switch response.result {
//            case .success:
//                
//                
//                if let jsonData = response.data{
//                    
//                    let response = try! JSONDecoder().decode(ResponseDataArray<Bargainings>.self, from: jsonData)
//                    if response.success{
//                        
//                        self.bargainingApiResponse = response
//                        
//                    }
//                    else{
//                        print("Eroor=\(response.message)")
//                        
//                    }
//                }
//            case .failure(let error):
//                print("ERROR==\(error)")
//            }
//            
//            completion()
//        }
//        
//    }
//    
//    
//    func getParkings(completion:@escaping ()->Void){
//        
//        let params = ["vehicle_type" : 10]
//        //        let params:[String:Any]  = [:]
//        APIClient.getDataRequest(url: APIRouter.parkings(params)) { (response) in
//            
//            //            print(response)
//            
//            switch response.result {
//            case .success:
//                if let jsonData = response.data{
//                    
//                    let response = try! JSONDecoder().decode(ApiResponseMultipleData<ParkingData>.self, from: jsonData)
//                    self.parkingApiResponse = response
//                }
//            case .failure(let error):
//                print("ERROR==\(error)")
//            }
//            
//            completion()
//        }
//        
//    }
//    
//    func getPArkingsByID(id:Int){
//        
//        
//        APIClient.getDataRequest(url: APIRouter.parkingsById(id: id)) { (response) in
//            
//            //            print(response)
//            
//            switch response.result {
//            case .success:
//                if let jsonData = response.data{
//                    let response = try! JSONDecoder().decode(ParkingsById<ParkingData>.self, from: jsonData)
//                    self.pData.append(response.data)
//                    self.printData(data: self.pData[0])
//                }
//            case .failure(let error):
//                print("ERROR==\(error)")
//            }
//        }
//        
//    }
//    
//    func printData(data:ParkingData){
//        
//        print("Id: \(data.id)")
//        print("initialPrice: \(data.initialPrice)")
//        print("address: \(data.address ?? "")")
//        print("Note: \(data.note ?? "-")")
//    }
//    
//    
//    
//    
//    
//    
//}
//
//extension ViewController2:UITableViewDelegate,UITableViewDataSource{
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        return bData.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = weatherTbl.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
//        //        let cell = weatherTbl.dequeueReusableCell(withIdentifier: "WeatherCell")!
//        
//        cell.setData(day: bData[indexPath.row].statusText ?? "-", condition: bData[indexPath.row].statusText ?? "-", temp: bData[indexPath.row].id ?? 0 )
//        
//        return  cell;
//    }
//    
//    
//}
//
//
//
//
