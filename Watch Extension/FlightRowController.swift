//
//  FlightRowController.swift
//  Watch Extension
//
//  Created by Pedro Felipe Coloma de Araujo on 08/07/19.
//  Copyright © 2019 Mic Pringle. All rights reserved.
//

import WatchKit

class FlightRowController: NSObject {
  @IBOutlet var separator: WKInterfaceSeparator!
  @IBOutlet var originLabel: WKInterfaceLabel!
  @IBOutlet var destinationLabel: WKInterfaceLabel!
  @IBOutlet var flightNumberLabel: WKInterfaceLabel!
  @IBOutlet var statusLabel: WKInterfaceLabel!
  @IBOutlet var planeImage: WKInterfaceImage!
  
  var flight: Flight? {
    didSet {
      guard let flight = flight else { return }
      originLabel.setText(flight.origin)
      destinationLabel.setText(flight.destination)
      flightNumberLabel.setText(flight.number)
      if flight.onSchedule {
        statusLabel.setText("On Time")
      } else {
        statusLabel.setText("Delayed")
        statusLabel.setTextColor(.red)
      }
    }
  }
}
