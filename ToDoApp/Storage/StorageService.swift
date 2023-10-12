//
//  StorageService.swift
//  ToDoApp
//
//  Created by dmu mac 23 on 12/10/2023.
//

import Foundation


struct StorageService {

    func read (file: String) -> Data? {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {print("Could not find filepath when reading");return nil}
        let path = url.appendingPathComponent(file)
        do {
            if(FileManager.default.fileExists(atPath: path.path())) {
                return try Data(contentsOf: path)
            } else {
                return nil
            }
        } catch {
            print("Data could not be read from persistent storage")
        }


        return Data()
    }

    func write (data: Data, toFile: String) {
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {print("Could not find filepath when writing");return}
        let path = url.appendingPathComponent(toFile)
        do {
            let exists = FileManager.default.fileExists(atPath: path.path())
            if(exists) {
                try data.write(to: path)
            } else {

                FileManager.default.createFile(atPath: path.path(), contents: data)
            }
        } catch {
            print("data could not be written to persistent storage")
        }
    }
}
