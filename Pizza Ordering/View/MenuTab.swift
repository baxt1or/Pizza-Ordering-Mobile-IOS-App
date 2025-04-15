import SwiftUI

struct MenuTabView : View {
    
    
    var body: some View {
          
        ScrollView{
            VStack{
                
                HStack {

                  
                    Text("Your Orders")
                        .font(.system(size: 30, weight: .medium))
                        
                   
                        
                        
                    Spacer()
                    
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .padding()
                        .frame(width: 50, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 90).opacity(0.4).foregroundColor(Color.gray.opacity(0.3)))
                    
                }
                .padding(20)
                

                
                VStack {
                    ForEach(producList, id:\.id){ item  in
                        ProductCard(product: item)
                    }
                }
            }
        }
    }
}


#Preview {
    MenuTabView()
}
