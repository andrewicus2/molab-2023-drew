//
//  ImageHolder.swift
//  Image Generation
//
//  Created by Drew Brown on 9/28/23.
//

import Foundation


let possibleImages = ["minionz", "cats", "dog"]

var displayedImage = 0

func generateImage(){
    displayedImage = Int.random(in: 0...2)
    print(possibleImages[displayedImage])
}
