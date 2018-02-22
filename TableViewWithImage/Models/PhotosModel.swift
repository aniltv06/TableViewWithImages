//
//  PhotosModel.swift
//  TableViewWithImage
//
//  Created by Anil T V on 22/02/18.
//  Copyright © 2018 Anil Kumar T V. All rights reserved.
//

import UIKit

public class PhotosModel {
    let albumId : Int?
    let id : Int?
    let title : String?
    let imageURL : String?
    let thumbnailURL : String?
    var image : UIImage? = nil
    var thumbnailImage : UIImage? = nil
    
    init(jsonDict : [String:Any]) {
        self.albumId  = jsonDict["albumId"] as? Int
        self.id = jsonDict["id"] as? Int
        self.title = jsonDict["title"] as? String
        self.imageURL = jsonDict["url"] as? String
        self.thumbnailURL = jsonDict["thumbnailUrl"] as? String
    }
}
