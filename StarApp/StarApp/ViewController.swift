//
//  ViewController.swift
//  StarApp
//
//  Created by Diante Lewis-Jolley on 5/21/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func updateRating(_ ratingControl: CustomControl) {


            if ratingControl.value > 1 {
                title = "User Rating: \(ratingControl.value) stars"
            } else {
                title = "User Rating: 1 star"
            }
        }



}

