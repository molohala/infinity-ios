import BaseFeature
import SwiftUI
import DesignSystem

public struct CommunityCreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var viewModel = CommunityCreateViewModel()
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            LazyVStack {
                InfinityTextEditor("내용을 적어주세요", text: $viewModel.content)
                    .frame(minHeight: 300)
            }
            .padding(.horizontal, 16)
        }
        .hideKeyboardWhenTap()
        .navigationTitle("글쓰기")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("완료") {
                    dismiss()
                }
            }
        }
    }
}