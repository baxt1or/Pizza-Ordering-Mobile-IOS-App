import SwiftUI


struct CardComponent : Identifiable,  Hashable {
    var id : UUID = .init()
    var imageURL: String
    var title : String
}


let cardsList : [CardComponent] = [
    CardComponent(imageURL:"star", title: "Favorites"),
    CardComponent(imageURL:"purse", title: "Wallet"),
    CardComponent(imageURL:"received", title: "Orders")
]



struct Settings : Identifiable, Hashable {
    var id : UUID = .init()
    var icon: String
    var title : String
}


let settingsList : [Settings] = [
    Settings(icon: "tag", title: "Promotions"),
    Settings(icon: "trophy", title: "View Rewards"),
    Settings(icon: "paperplane", title: "Send Feedback"),
    Settings(icon: "gearshape", title: "App Preferences"),
    Settings(icon: "phone", title: "Support"),
    Settings(icon: "info.circle", title: "About Ovenly")
]

struct UserTabView : View {
    
    var body : some View {
        
        ScrollView{
            
            VStack{
                
                HStack{
                    Text("Hello, **Diana**")
                        .font(.system(size: 36))
                    
                    Spacer()
                    
                    Image("person")
                        .resizable()
                        .frame(width: 60,height: 60)
                        .aspectRatio(contentMode: .fit)
                }
                .padding(20)
                
                HStack {
                    HStack(spacing: 8) {
                        
                        
                        Text("Personal")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Image(systemName: "person")
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
                .background(Color.gray.opacity(0.05))
                .cornerRadius(10)
                .padding(10)
                
                
                
                
                
                HStack(spacing : 20){
                    
                    ForEach(cardsList, id: \.id){item in
                        
                        SectionsView(card: item)
                    }
                    
                }.padding(10)
                
                
                
                VStack(spacing : 46){
                    
                    ForEach(settingsList, id : \.id){item in
                        HStack(spacing : 24) {
                            Image(systemName: item.icon)
                                .resizable()
                                .frame(width: 22, height: 22)
                            
                            VStack(alignment: .leading){
                                Text(item.title)
                                    .font(.system(size: 20, weight: .medium))
//                                
//                                Text(item.description)
//                                    .font(.system(size: 15, weight: .light))
                            }
                            
                            Spacer()
                        }
                    }
                }
                .padding(20)
                
                
                
            }
        }
    }
}



struct SectionsView : View {
    
    var card : CardComponent
    
    var body : some View {
         
        VStack{
            Image(card.imageURL)
            
            Text(card.title)
                .font(.system(size: 18, weight: .bold))
        }
        .frame(width: 110, height: 110)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
    }
}


#Preview {
    UserTabView()
}
