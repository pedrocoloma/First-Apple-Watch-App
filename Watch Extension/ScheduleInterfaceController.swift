//
//  ScheduleInterfaceController.swift
//  Watch Extension
//
//  Created by Pedro Felipe Coloma de Araujo on 08/07/19.
//  Copyright © 2019 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class ScheduleInterfaceController: WKInterfaceController {

  @IBOutlet weak var flightsTable: WKInterfaceTable!
  
  var flights = Flight.allFlights()
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    flightsTable.setNumberOfRows(flights.count, withRowType: "FlightRow")
    
    for index in 0..<flightsTable.numberOfRows {
      guard let controller = flightsTable.rowController(at: index) as? FlightRowController else { continue }
      
      controller.flight = flights[index]
    }
  }
  
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    let flight = flights[rowIndex]
    let controllers = ["Flight", "CheckIn"]
    presentController(withNames: controllers, contexts: [flight, flight])
  }
  
}
