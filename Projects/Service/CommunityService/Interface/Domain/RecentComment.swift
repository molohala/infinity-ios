import Foundation

public struct RecentComment {
    public let commentId: Int
    public let content: String
    public let createdAt: Date
    public let memberId: Int
    public let name: String
    
    public init(commentId: Int, content: String, createdAt: Date, memberId: Int, name: String) {
        self.commentId = commentId
        self.content = content
        self.createdAt = createdAt
        self.memberId = memberId
        self.name = name
    }
}