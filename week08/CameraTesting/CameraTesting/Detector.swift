//
//  Detector.swift
//  CameraTesting
//
//  Created by drew on 11/1/23.
//

// Source: https://www.neuralception.com/detection-app-tutorial-detector/

import Vision
import AVFoundation
import UIKit
import CoreImage

extension ViewController {
    
    func setupDetector() {
        let modelURL = Bundle.main.url(forResource: "YOLOv3Int8LUT", withExtension: "mlmodelc")
    
        do {
            let visionModel = try VNCoreMLModel(for: MLModel(contentsOf: modelURL!))
            let recognitions = VNCoreMLRequest(model: visionModel, completionHandler: detectionDidComplete)
            self.requests = [recognitions]
        } catch let error {
            print(error)
        }
    }
    
    func detectionDidComplete(request: VNRequest, error: Error?) {
        DispatchQueue.main.async(execute: {
            if let results = request.results {
                self.extractDetections(results)
            }
        })
    }
    
    func extractDetections(_ results: [VNObservation]) {
        detectionLayer.sublayers = nil
        
        for observation in results where observation is VNRecognizedObjectObservation {
            guard let objectObservation = observation as? VNRecognizedObjectObservation else { continue }
                        
            let objectBounds = VNImageRectForNormalizedRect(objectObservation.boundingBox, Int(screenRect.size.width), Int(screenRect.size.height))
            let transformedBounds = CGRect(x: objectBounds.minX, y: screenRect.size.height - objectBounds.maxY, width: objectBounds.maxX - objectBounds.minX, height: objectBounds.maxY - objectBounds.minY)
            
            let boxLayer = self.drawBoundingBox(transformedBounds, label:objectObservation.labels[0].identifier)

            detectionLayer.addSublayer(boxLayer)
            
        }
    }
    
    func setupLayers() {
        detectionLayer = CALayer()
        detectionLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        self.view.layer.addSublayer(detectionLayer)
    }
    
    func updateLayers() {
        detectionLayer?.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
    }
    
    func drawBoundingBox(_ bounds: CGRect, label: String) -> CALayer {
        let boxLayer = CALayer()
        
        // Source: https://stackoverflow.com/questions/2209734/add-text-to-calayer/56159695#56159695
        
        let textlayer = CATextLayer()

        textlayer.frame = CGRect(x: 0, y: -18, width: bounds.width, height: 20)
        textlayer.cornerRadius = 4
        textlayer.fontSize = 14
        textlayer.alignmentMode = .left
        textlayer.string = label
        textlayer.isWrapped = true
        textlayer.truncationMode = .end
        textlayer.backgroundColor = UIColor.red.cgColor
        textlayer.foregroundColor = UIColor.white.cgColor
        textlayer.contentsScale = UIScreen.main.scale
        boxLayer.addSublayer(textlayer)
        
        boxLayer.frame = bounds
        boxLayer.borderWidth = 2.0
        boxLayer.borderColor = UIColor.red.cgColor
        boxLayer.cornerRadius = 4
        return boxLayer
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let imageRequestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:]) // Create handler to perform request on the buffer

        do {
            try imageRequestHandler.perform(self.requests) // Schedules vision requests to be performed
        } catch {
            print(error)
        }
    }
}
