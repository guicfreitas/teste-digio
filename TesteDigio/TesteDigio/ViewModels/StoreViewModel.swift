//
//  Parser.swift
//  TesteDigio
//
//  Created by João Guilherme on 14/07/22.
//

import Foundation

struct StoreViewModel {
    var storeData: Store?

    func makeData(completition: @escaping ((Store?) -> Void) ) {
        guard let api = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products") else {
            return completition(nil)
        }

        URLSession.shared.dataTask(with: api) { data, _, error in
            guard let data = data else {
                return
            }

            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }

            do {
                let result = try JSONDecoder().decode(Store.self, from: data)
                completition(result)
            } catch {
                print("entrou no catch")
            }
        }.resume()
    }
}
