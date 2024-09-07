//
//  RecordingEntity.swift
//  SongSync
//
//  Created by Rusbeh Turki on 9/7/24.
//
//

import Foundation
import SwiftData


@Model public class RecordingEntity {
    var id: UUID?
    var name: String?
    var fileURL: URL?
    var date: Date?
    public init() {

    }
    
}
