import SwiftUI
import DesignSystem

struct TextFieldPreview: View {
    
    @State private var id = ""
    @State private var pw = ""
    @State private var content = ""
    
    var body: some View {
        ScrollView {
            VStack {
                GrowTextField("아이디", text: $id)
                GrowTextField("비밀번호", text: $pw, isSecured: true)
                GrowTextField("비밀번호", text: $pw, isEnabled: false, isRounded: true)
                GrowTextEditor(text: $content)
                    .frame(height: 300)
                GrowTextEditor(text: $content, isEnabled: false)
                    .frame(height: 300)
            }
        }
        .growBackground(.background)
    }
}
