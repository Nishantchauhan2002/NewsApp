//
//  DatabaseManager.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 13/03/24.
//

import Foundation
import SQLite3
import UIKit
var shareInstance = DatabaseManager()
class DatabaseManager: NSObject{
    
    var database:FMDatabase? = nil
    
    
    class func getInstance() -> DatabaseManager{
        if shareInstance.database == nil{
            shareInstance.database = FMDatabase(path: Util.getPath("SignUpDb.db"))
        }
        return shareInstance
    }
    
    func saveData(_ modelInfo:SignUpModel) -> Bool{
        shareInstance.database?.open()
        
        let emailExistsQuery = "SELECT COUNT(*) FROM signup WHERE email = ?"
        let resultSet = database?.executeQuery(emailExistsQuery, withArgumentsIn: [modelInfo.email])
            
        var emailExist = false
        
        if let resultSet = resultSet {
                if resultSet.next() {
                    let count = resultSet.int(forColumnIndex: 0)
                    emailExist = count != 0
                }
            }
            
            resultSet?.close()
            
            if emailExist {
                // Email already exists, do not save data
                database!.close()
            
                return false
            }
        
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO signup (fname,email,password,nation) VALUES (?,?,?,?)", withArgumentsIn: [modelInfo.fname,modelInfo.email,modelInfo.password,modelInfo.nation])
        shareInstance.database?.close()
        return isSave!
    }
    
    func loginUser(email: String, password: String) -> Bool {
        shareInstance.database?.open()
        
        let loginQuery = "SELECT COUNT(*) FROM signup WHERE email = ? AND password = ?"
        let resultSet = database?.executeQuery(loginQuery, withArgumentsIn: [email, password])
        
        var userExists = false
        
        if let resultSet = resultSet {
            if resultSet.next() {
                let count = resultSet.int(forColumnIndex: 0)
                userExists = count != 0
            }
        }
        
        resultSet?.close()
        
        if userExists {
            // User exists, allow login
            shareInstance.database?.close()
            return true
        } else {
            // User does not exist or invalid credentials
            shareInstance.database?.close()
            return false
        }
    }

    
    
}

