//
//  SessionManager.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 30/12/21.
//

import UIKit

class SessionManager: NSObject {

  static let shared = SessionManager()

  var articles: [Article]?
}
