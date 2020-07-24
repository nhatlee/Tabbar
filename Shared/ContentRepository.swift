//
//  ContentRepository.swift
//  CustomTabbar
//
//  Created by nhatle on 7/24/20.
//

import Foundation
import Combine

extension FileManager {
  static func sharedContainerURL() -> URL {
    return FileManager.default.containerURL(
      forSecurityApplicationGroupIdentifier: "group.CY-01F73342-C96E-11E9-9C7A-AF2C8543F9DE.com.cydia.Extender"
    )!
  }
}

