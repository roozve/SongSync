//
//  RecordingEntity+CoreDataProperties.swift
//  SongSync
//
//  Created by Rusbeh Turki on 9/6/24.
//

import Foundation
import CoreData

extension RecordingEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecordingEntity> {
        return NSFetchRequest<RecordingEntity>(entityName: "RecordingEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var fileURL: URL?
    @NSManaged public var date: Date?
}

extension RecordingEntity: Identifiable {}
