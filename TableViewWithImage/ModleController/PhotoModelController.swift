//
//  PhotoModelController.swift
//  TableViewWithImage
//
//  Created by Anil T V on 22/02/18.
//  Copyright © 2018 Anil Kumar T V. All rights reserved.
//

import UIKit

class PhotoModelController: NSObject {
    
    var resultsList = [PhotosModel]()
    
    func fetchImage(fromUrl: String, completionHandler:@escaping (UIImage?, NSError?) -> Void) {
        let fetchImageCompletionHandler = { [weak self] (serviceResponse: ServiceResponse) -> Void in
            guard self != nil  else { return }
            if let error = serviceResponse.responseError {
                
                completionHandler(nil, error as NSError?)
                
                Swift.print("Error while searching area = \(error.userInfo[NSLocalizedDescriptionKey] ?? "unknown")")
                
                return
            }
            if let image = serviceResponse.image {
                completionHandler(image, nil)
            } else {
                completionHandler(nil, nil)
            }
        }
        
        SessionManager.sharedInstance.sendServerRequest(method: .get,
                                                        baseURL: fromUrl,
                                                        endPoint: "",
                                                        completionHandler: fetchImageCompletionHandler)
    }
    
    func fetchJson(completionHandler:@escaping (NSError?) -> Void) {
        let fetchCompletionHandler = { [weak self] (serviceResponse: ServiceResponse) -> Void in
            guard self != nil  else { return }
            if let error = serviceResponse.responseError {
                
                completionHandler(error as NSError?)
                
                Swift.print("Error while searching area = \(error.userInfo[NSLocalizedDescriptionKey] ?? "unknown")")
                
                return
            }
            if let jsonArray = serviceResponse.jsonObject as? [[String:Any]] {
                
                for jsonDict in jsonArray {
                    let photosDict = PhotosModel(jsonDict: jsonDict)
                    self?.resultsList.append(photosDict)
                }
            }
            completionHandler(nil)
        }
        SessionManager.sharedInstance.sendServerRequest(method: .get,
                                                        endPoint: "photos",
                                                        completionHandler: fetchCompletionHandler)
    }
    
}
