//
//  UserViewModel.swift
//  APIUserContactproj0805
//
//  Created by Shreyas on 09/05/25.
//

import Foundation

class UserViewModel: ObservableObject{
    @Published var users: [User] = []
    
    func fetchUsers(completion: @escaping(Result<[User], Error>)-> Void){
        print("fetching users......")
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                print("Network Error:", error)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                print("No data returned.")
                return
            }
            print("Raw data:", String(data: data, encoding: .utf8) ?? "N/A")

            do{
                let decoded = try JSONDecoder().decode([User].self, from: data)
                completion(.success(decoded))
            }catch {
                completion(.failure(error))
                print("Decoding error:", error)
            }
        }
        .resume()
    }
    
    func loadUsers(){
        fetchUsers{ result in               // here calling to fetchUsers
            DispatchQueue.main.async{       //use to updates must be done on main thread
                switch result{
                case .success(let users):
                    self.users = users      //here the data updates and stores
                case .failure(_):
                    break
                }
            }
        }
    }
}
