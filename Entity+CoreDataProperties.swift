//
//  Entity+CoreDataProperties.swift
//  SongSync
//
//  Created by Rusbeh Turki on 9/6/24.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var fileURL: URL?
    @NSManaged public var date: Date?

}

extension Entity : Identifiable {

}
