//
//  ImageStorage.swift
//  ImageVault
//
//  Created by Vikash Hart on 10/31/22.
//

import Foundation
import UIKit

class ImageStorage {
    private func saveImage(image: UIImage) -> String {
        guard let data = image.jpegData(compressionQuality: 0) else { return "Save action failed" }
        let imageData = NSData(data: data)
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,  FileManager.SearchPathDomainMask.userDomainMask, true)
        let docs = paths[0] as NSString
        let uuid = NSUUID().uuidString + ".png"
        let fullPath = docs.appendingPathComponent(uuid)
        _ = imageData.write(toFile: fullPath, atomically: true)
        return uuid
    }

    func saveImages(images: [UIImage]) {
        guard images.count > 0 else { return }
        for image in images {
            saveImage(image: image)
        }
    }
}
