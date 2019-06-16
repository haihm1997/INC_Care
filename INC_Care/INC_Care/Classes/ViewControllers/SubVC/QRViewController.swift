//
//  QRViewController.swift
//  INC_Care
//
//  Created by Hoàng Hải on 6/16/19.
//  Copyright © 2019 Boogeymen. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {
    
    @IBOutlet weak var containerImageView: UIImageView!
    
    var patientID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getQRImage()
    }
    
    private func getQRImage() {
        let data = patientID.data(using: String.Encoding.ascii)
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else {
            return
        }
        qrFilter.setValue(data, forKey: "inputMessage")
        
        guard let qrImage = qrFilter.outputImage else {
            return
        }
        
        // Scale the image
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else {
            return
        }
        let resultImage = UIImage(cgImage: cgImage)
        
        containerImageView.image = resultImage
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
