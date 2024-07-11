// Service.swift
// Birdler
//
// Created by Pedro Ribeiro on 09/07/2024.
//

import Foundation

class Service {
    
    func getNews(completion: @escaping(Result<[NewsModel], Error>) -> Void) {
        // Definir a URL...
        guard let url = URL(string: "https://birdler-api.vercel.app/news/get") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "URL inválida"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let dataResult = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Nenhum dado retornado"])))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Resposta inválida"])))
                return
            }
            
            if response.statusCode == 200 {
                // Sucesso
                do {
                    let decoder = JSONDecoder()
                    let dadosConvertidos = try decoder.decode([NewsModel].self, from: dataResult)
                    completion(.success(dadosConvertidos))
                } catch {
                    completion(.failure(error))
                }
            } else {
                // Fracasso
                let errorDescription = "Request falhou com status code: \(response.statusCode)"
                completion(.failure(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
            }
        }
        task.resume()
    }
    
}
