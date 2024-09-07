//
//  RecordingEntity.swift
//  SongSync
//
//  Created by Rusbeh Turki on 9/6/24.
//

import Foundation
import CoreData

@objc(RecordingEntity)
public class RecordingEntity: NSManagedObject {
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var fileURL: URL?
    @NSManaged public var date: Date?
}
