import BaseService
import Foundation
import Crypto

public final class DAuthService: BaseService<DAuthService> {
    
    override init() {}
    
    public static let shared = DAuthService()
}

public extension DAuthService {
    
    func dodamSignIn(id: String, pw: String) async throws -> BaseResponse<DodamSignInResponse> {
        
        let encryptedPw = SHA512.hash(data: Data(pw.utf8))
        let hashedPw = encryptedPw.compactMap { String(format: "%02x", $0) }.joined()
        
        let req = DodamSignInRequest(id: id,
                                     pw: hashedPw,
                                     clientId: DAuth.clientId,
                                     redirectUrl: DAuth.redirectUrl)
        
        return try await requestPost(url: "https://dauth.b1nd.com/api/auth/login/", req: req, res: BaseResponse<DodamSignInResponse>.self)
    }
}