//
//  ViewController.swift
//  ObjectMapDemo
//
//  Created by Apple on 08/01/2020.
//  Copyright © 2020 Talha. All rights reserved.
//

import UIKit
import Alamofire




class ViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var imgData:Data?
    var pData = [Parking]()
    var bData = [Bargaining]()
    var parkingApiResponse:ResponseDataArray<Parking>?
    var bargainingApiResponse:ResponseDataArray<Bargaining>?
    
    let params:[String:Any]  = ["vehicle_type": 10, "parking_type": 20, "status": 10, "initial_price": 12.0, "final_price": 0.0, "start_at": "string", "end_at": "string", "address": "string", "longitude": "string", "latitude": "string", "is_negotiable": false, "note": "string", "parking_hours_limit": 0.0, "parking_allowed_until": "string", "parking_extra_fee" : 0.0,"parking_extra_fee_unit": 10, "is_resident_free": false]
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var locatiobLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerCell()
        
        
        
        
        //Get Bargainings
//        getBargainings()
        
        //Get Parkings
//        getParkings()
        
        
        //Post Parking
//        postParking(params: self.params)
        
        
        
    }
    
    func registerCell(){
        
        myTableView.tableFooterView = UIView()
        myTableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
    }
    
    
    func postParking(params:[String:Any]){
        
        Alamofire.request(APIRouter.postParking(params)).postParkingResponse{ response in
            
            switch response.result {
            case .success:
                if response.result.value?.success ?? false{

                    print("val=\(response.result.value?.message ?? "-")")

                }
                else{
                    print("Server Message=\(response.result.value?.message ?? "-" )")

                }
                
            case .failure(let error):
                print("ERROR==\(error)")
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        print("MEDIA-URL=\(UIImagePickerController.InfoKey.mediaMetadata)")
        

        picker.self.dismiss(animated: true)
        guard let imageData = img?.jpegData(compressionQuality: 1.0) else {
            print("Could not get JPEG representation of UIImage")
            return
        }
        
        self.imgData = imageData
    }
    
    func postParkingWithMultiparts(url:URLRequestConvertible, imageData:Data, params:[String:Any]){

        
        Alamofire.upload(multipartFormData: { multipartFormData in
            for (key, value) in params {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            multipartFormData.append(imageData,
                                     withName: "image",
                                     fileName: "image.jpg",
                                     mimeType: "image/jpeg")
        }, with: url, encodingCompletion: { encodingResult in
            
            
            switch encodingResult {
            case .success(let upload, _, _):
                upload.uploadProgress { progress in
                }
                upload.validate()
                upload.responseJSON { response in
                    
                    
                    switch response.result {
                    case .success:
                        print(response)
//                        completion(response)
                        break
                    case .failure(let error):
                        print(error)
//                        completion(response)
                    }
                }
            case .failure(_):
                print(encodingResult)
                //                                completion(encodingResult)
                
            }
        })
    
    }
   
    
    func getParkings(){

        let params:[String:Any]  = [ "is_schedule" : 1 ]

        Alamofire.request(APIRouter.getParkings(params)).parkingResponse{ response in

            switch response.result {
                case .success:
                    if response.result.value?.success ?? false {

                        if let val = response.result.value?.data {
                            //                print("bData=\(bData)")
                            self.pData = val
                            self.myTableView.reloadData()
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
        
        Alamofire.request(APIRouter.getBargainings(params)).bargainingResponse{ response in
            
            switch response.result {
                case .success:
                    if response.result.value?.success ?? false {
                        
                        if let val = response.result.value?.data {
                            //                print("bData=\(bData)")
                            self.bData = val
                            self.myTableView.reloadData()
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
    
    @IBAction func open_cam_btn(_ sender: UIButton) {
        print("cam")
//        self.showAlert()
        self.getParkingsNew()
    }
    
    @IBAction func postData(_ sender: UIButton) {
        
        print("image====\(String(describing: self.imgData))")
        
        if let img = self.imgData{
//            postParkingWithMultiparts(url: APIRouter.postParking(params), imageData: img, params: self.params)
        }
    }
    
    
    func showAlert() {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        
        //Check is source type available
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            imagePickerController.modalPresentationStyle = .fullScreen
            //            addChild(imagePickerController)
            //            view.addSubview(imagePickerController.view)
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func getParkingsNew(){
        
        let params:[String:Any]  = [ "is_schedule" : 1 ]
        
        
        APIClient.getData(url: APIRouter.getParkings(params), dec: ResponseDataArray<Parking>.self) { (response,error) in
            
            if(response != nil){
                if let success = response?.success {
                    //                    print("Succes=\(success)")
                    Helper().showToast(message: "Succes=\(success)", controller: self)
                    if let val = response?.data {
                        //                print("bData=\(bData)")
                        self.pData = val
                        self.myTableView.reloadData()
                    }
                }
                else{
                    //                    print("Server Message=\(response?.message ?? "-" )")
                    Helper().showToast(message: "Server Message=\(response?.message ?? "-" )", controller: self)
                }
            }
            else if(error != nil){
                //                print("Error=\(error?.localizedDescription ?? "" )")
                Helper().showToast(message: "Error=\(error?.localizedDescription ?? "" )", controller: self)
            }
            else{
                //                print("Nor Response and Error!!")
                Helper().showToast(message: "Nor Response and Error!!", controller: self)
            }
            
        }
        
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pData.count
//        return bData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
        //        let cell = weatherTbl.dequeueReusableCell(withIdentifier: "WeatherCell")!
        
        cell.setData(day: pData[indexPath.row].seller?.name ?? Nulls.nullString, condition: pData[indexPath.row].parkingTypeText ?? Nulls.nullString, temp: pData[indexPath.row].initialPrice ?? Nulls.nullDouble)
//        cell.setData(day: bData[indexPath.row].createdAt ?? Nulls.nullString, condition: bData[indexPath.row].createdAt ?? Nulls.nullString, temp: bData[indexPath.row].offer ?? Nulls.nullDouble)
        
        return  cell;
    }
    
    
   
    
}




