//
//  QuoteService.swift
//  MyAnimeApp
//
//  Created by EasyPOS iOS Dev on 2/27/23.
//

import Foundation
import Alamofire

class QuoteService {
    func getRandomQuote( completion: @escaping(Quote?, Error?)->()) {
        if let animeQuoteURL = URL(string: "https://animechan.vercel.app/api/random") {
            AF.request(
                animeQuoteURL,
                method: .get
            ).responseDecodable(of: Quote?.self) { response in
                switch response.result {
                    case .success(let quote):
                        completion(quote, nil)
                    case .failure(let error):
                        completion(nil, error)
                }
            }
        } else {
            var error = ConnectionError("Network error!")
            completion(nil, error)
        }
    }
}

struct ConnectionError: LocalizedError
{
    let message: String

    init(_ message: String)
    {
        self.message = message
    }

    public var errorDescription: String?
    {
        return message
    }
}
