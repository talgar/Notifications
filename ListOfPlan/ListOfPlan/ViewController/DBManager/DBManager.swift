//
//  DBManager.swift
//  List Of Plan
//
//  Created by admin on 05.12.2020.
//  Copyright © 2020 admin. All rights reserved.
//


//import UIKit
//import RealmSwift
//
//class DBManager {
//
//    var database: Realm!
//    static let sharedInstance = DBManager()
//
//
//    private init() {
//        database = try! Realm()
//    }
//
//    func getDataFromDB() -> Results<Items> {
//        let results: Results<Items> = database.objects(Items.self)
//        return results
//    }
//
//    func addData(object: Items)   {
//        try! database.write {
//            database.add(object)
//            print("Added new object")
//        }
//    }
//
//    func deleteFromDb(object: Items)   {
//        try!   database.write {
//            database.delete(object)
//        }
//    }
//
//    func completedFromDB(object: Items) -> Bool {
//        try! database.write {
//            object.completed = !(object.completed)
//            return object.completed
//        }
//    }
//}
