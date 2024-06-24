//
//  Favorites+CoreDataProperties.swift
//  Getaround-test
//
//  Created by Jaouher  on 24/06/2024.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var carId: String?

}

extension Favorites : Identifiable {

}
