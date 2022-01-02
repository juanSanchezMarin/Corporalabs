//
//  APIManager.swift
//  Corporalabs
//
//  Created by Juan Sánchez Marín on 29/12/21.
//

import Alamofire

public let sharedAPIManager = APIManager()

/// API manager class for manage service requests.
public class APIManager {

    /// Main function for API service requests.
    /// - Parameters:
    ///   - params: APIParams object with customize the results an provide authorization for request.
    ///   - output: request response decoded with main model (array of Result model).

    func fetchFilms(params: APIParams, output: @escaping(_ result: APIResult, _ articles: [Article]?) -> Void) {
        let path = Constants.Paths.base + params.articleType + "/all-sections/" + params.lastDaysType
        let url = path + ".json?api-key=" + Constants.APIinfo.publicKey
        AF.request(url, method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: [Constants.APIinfo.applicationType])
            .responseDecodable(of: Articles.self) { (response) in
                switch response.result {
                    case .success:
                        guard let articles = response.value else { return }
                        SessionManager.shared.articles = articles.all
                        output(.success, articles.all)
                    case let .failure(error):
                        print("ArticleRepository:getAllArticles:error: \(error.localizedDescription)")
                        output(.error, nil)
                }
            }
      }
}
