
import SwiftUI

struct MenuView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            // Your content views
            Group {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    MenuTabView()
                case 2:
                    BagTabView()
                case 3:
                    FavoritesTabView()
                case 4:
                    UserTabView()
                default:
                    HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Custom Tab Bar
            HStack {
                tabBarButton(icon: "house", text: "Home", tag: 0)
                tabBarButton(icon: "book", text: "Menu", tag: 1)
                tabBarButton(icon: "bag", text: "Korzinka", tag: 2)
                tabBarButton(icon: "heart", text: "Favorites", tag: 3)
                tabBarButton(icon: "person", text: "Me", tag: 4)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 25)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 5)
     
           
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
  
    @ViewBuilder
    private func tabBarButton(icon: String, text: String, tag: Int) -> some View {
        Button(action: {
            selectedTab = tag
        }) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(text)
                    .font(.caption)
            }
            .foregroundColor(selectedTab == tag ? .brown : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}



#Preview {
    MenuView()
}
