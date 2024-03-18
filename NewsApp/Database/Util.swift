//
//  Util.swift
//  NewsApp
//
//  Created by Nishant Chauhan on 13/03/24.
//
import Foundation
import SQLite3
class Util: NSObject{
    
//    class func getPath(_ fileName: String) -> String{
//        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let fileUrl = documentDirectory.appendingPathComponent(fileName)
//        print("Database Path :- \(fileUrl.path)")
//        return fileUrl.path
//    }
//
    class func getPath(_ fileName: String) -> String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        print("Database Path :- \(fileUrl.path)")
        return fileUrl.path
    }
    class func copyDatabase(_ filename: String){
        let dbPath = getPath("SignUpDb.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(filename)
            var error:NSError?
            do{
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }catch let error1 as NSError{
                error = error1
            }
            
            if error == nil{
                print("error in db")
            }else{
                print("You have an error \(error)")
            }
    
        }
    }
}
