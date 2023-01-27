import Foundation

enum ProfileFilter: Int, CaseIterable {
    case tweets // 0
    case tweetAndReplies // 1
    case likes // 2

    var description: String {
        switch self {
            case .tweets: return "Tweets"
            case .tweetAndReplies: return "Tweets & Replies"
            case .likes: return "Likes"
        }
    }
}
