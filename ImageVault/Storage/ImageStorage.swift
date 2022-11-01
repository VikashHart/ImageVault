//
//  ImageStorage.swift
//  ImageVault
//
//  Created by Vikash Hart on 10/31/22.
//

import Foundation
import UIKit

protocol ImageHandling {
    func saveImages(images: [UIImage])
    func getImages() -> [UIImage]
    func deleteImages(images: [UIImage])
}
class ImageStorage: ImageHandling {
    static let shared = ImageStorage()
    private var imageCache: [String] = []

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
            imageCache.append(saveImage(image: image))
        }
    }

    private func getFilePath(fileName: String) -> String? {
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        var filePath: String?
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if paths.count > 0 {
            let dirPath = paths[0] as NSString
            filePath = dirPath.appendingPathComponent(fileName)
        }
        else {
            filePath = nil
        }

        return filePath
    }

    func getImages() -> [UIImage] {
        let imageNames = imageCache
        var savedImages: [UIImage] = [UIImage]()

        for imageName in imageNames {
            if let imagePath = getFilePath(fileName: imageName) {
                guard let image = UIImage(contentsOfFile: imagePath) else { return [] }
                savedImages.append(image)
            }
        }

        return savedImages
    }

    func deleteImages(images: [UIImage]) {
        //todo: add image removal
    }
}
