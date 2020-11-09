//
//  NetworkingManager.swift
//  FireflyLogin
//
//  Created by Rohan Aurora on 11/9/20.
//  Copyright © 2020 Rohan Aurora. All rights reserved.
//

import UIKit

struct DataManager {
    
    internal func makeMockRequest(completion: @escaping () -> Void) {
        let url = URL(string: Links.mockURL)!
        var client: NetworkClient!
        var mockSession: MockURLSession!
        
        mockSession = createMockSession(forCode: 200, andError: nil)
        client = NetworkClient(withSession: mockSession)
        
        client.requestLogin(url: url) { result, errorMessage in
            guard let res = result else { return }
            print(res.debugDescription)
            
            if let e = errorMessage {
                print(e)
            }
            completion()
        }
    }
    
    
    internal func createMockSession(forCode code: Int, andError error: Error?) -> MockURLSession? {
        guard let data = readData() else { return nil }
        let response = HTTPURLResponse(url: URL(string: Links.mockURL)!,
                                       statusCode: code, httpVersion: nil, headerFields: nil)
        return MockURLSession(completionHandler: (data, response, error))
    }
    
    
    internal func generateMock() {
        let userDict = User(username: UserStore.shared.username, isSuccessful: UserStore.shared.isLoggedIn)
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("User.json")
            try JSONEncoder().encode(userDict)
                .write(to: fileURL)
        } catch {
            print(error)
        }
    }
}

// Helper Methods
extension DataManager {
    private func getDocumentsDirectory() -> URL? {
        let paths = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        guard let documentsDirectory = paths.first else { return nil }
        return documentsDirectory
    }
    
    private func readData() -> Data? {
        do {
            let fileURL = try FileManager.default
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("User.json")
            return try Data(contentsOf: fileURL)
        } catch {
            print(error)
        }
        return nil
    }
}
