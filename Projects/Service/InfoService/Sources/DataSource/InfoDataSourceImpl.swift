import BaseService
import InfoServiceInterface

class InfoDataSourceImpl: BaseRemoteDataSource<InfoDataSourceImpl>, InfoDataSource {
    private let path = "info"
    
    func getSolvedav(name: String) async throws -> Solvedav {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/solvedac?name=\(name)", res: BaseResponse<SolvedavResponse>.self).data.toDomain()
    }
    
    func getGithub(name: String) async throws -> Github {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/github?name=\(name)", res: BaseResponse<GithubResponse>.self).data.toDomain()
    }
    
    func registerSolvedac(_ req: SocialIdRequest) async throws {
        try await requestPost(url: "\(Grow.baseUrl)/\(path)/solvedac", req: req, res: BaseVoidResponse.self)
    }
    
    func registerGithub(_ req: SocialIdRequest) async throws {
        try await requestPost(url: "\(Grow.baseUrl)/\(path)/github", req: req, res: BaseVoidResponse.self)
    }
    
    func getProfile() async throws -> Profile {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/me", res: BaseResponse<ProfileResponse>.self).data.toDomain()
    }
    
    func getProfile(memberId: Int) async throws -> Profile {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/user/\(memberId)", res: BaseResponse<ProfileResponse>.self).data.toDomain()
    }
    func patchMyProfile(_ req: PatchMyProfileRequest) async throws {
        try await requestPatch(url: "\(Grow.baseUrl)/\(path)/me", req: req, res: BaseVoidResponse.self)
    }
    
    func getJobs() async throws -> [String] {
        try await requestGet(url: "\(Grow.baseUrl)/\(path)/jobs", res: BaseResponse<[String]>.self).data
    }
}
