import SwiftUI
import SwiftData

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
}

let categoryList: [CategoryModel] = [
    CategoryModel(title: "All Pizzas"),
    CategoryModel(title: "Vegetarian"),
    CategoryModel(title: "Special"),
    CategoryModel(title: "Meat"),
    CategoryModel(title: "Cheese")
]


struct AdsModel : Identifiable, Hashable {
    var id : UUID = .init()
    var title : String
    var description : String
    var imageURL : String
    var color : Color
}

let adsList : [AdsModel] = [
    AdsModel(title : "Special Order", description: "Discount 20% off applied at checkout", imageURL: "pizza", color:.gray),
    AdsModel(title : "Special Order", description: "Discount 20% off applied at checkout", imageURL: "pizza", color:.yellow),
    AdsModel(title : "Special Order", description: "Discount 20% off applied at checkout", imageURL: "pizza", color:.brown)
    
]


struct Product : Identifiable, Hashable {
    
    var id : UUID = .init()
    var name : String
    var isAvaliable : Bool
    var price : String
    var discount : String
    var imageURL : String
}


let producList : [Product] = [
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "wholepizza"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "pizzawhole2"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "wholepizza"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "pizzawhole2"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "wholepizza"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "pizzawhole2"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "wholepizza"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "pizzawhole2"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "wholepizza"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "pizzawhole2"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "wholepizza"),
    Product(name:"Pepperoni Pizza", isAvaliable: true, price: "$10", discount: "20%", imageURL: "pizzawhole2")
]

struct HomeView : View {
    
    @State var selectCategory = ""
    
    var body : some View{
       
        ScrollView{
            VStack {
//                Header
                HStack {

                    VStack(alignment: .leading){
                        Text("Location")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                           
                        HStack{
                            Image("Location")
                            
                            Text("Tashkent, **Uzbekistan**")
                                .font(.system(size: 22))
                                
                            Image(systemName: "chevron.down")
                                .padding(.horizontal, 2)
                        }
                        
                        
                    }
                    .padding(10)
                    
                    Spacer()
                    
                    Image(systemName: "bell.fill")
                        .imageScale(.large)
                        .padding()
                        .frame(width: 50, height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 90).opacity(0.4).foregroundColor(Color.gray.opacity(0.3)))
                    
                }
                .padding(10)
                
                
                HStack {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        Text("Search your favorite pizza")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                        
                        Spacer()
                    }
                    
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 15)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 10)
                
//                Ads Card
                
                ScrollView(.horizontal, showsIndicators: false){
                   
                HStack{
                        ForEach(adsList, id:\.id){item in
                            AdsCard(ad: item)
                        }
                }
                .padding(10)
                }
                
                
                HStack {
                    Text("Popular **Pizza**")
                        .font(.system(size: 30))
                    
                    Spacer()
                    
                    Text("See all")
                        .font(.system(size: 20, weight: .light))
                        .foregroundColor(.brown)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                
            }
                
                //Tab Menu List
                CategoryListView
                
                
            
           
                VStack {
                    ForEach(producList.prefix(5), id:\.id){ item  in
                        ProductCard(product: item)
                    }
                }
            
  
        }
    }
    
    
    var CategoryListView : some View {
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    
                    ForEach(categoryList, id: \.id ) { item in
                        Button {
                            selectCategory = item.title
                        } label: {
                          
                             
                                
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectCategory == item.title ? .brown : Color.gray.opacity(0.1))
                            .foregroundColor(selectCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        
                        
                    }
                   
                    
                }
            }
        
        .padding(.horizontal, 20)
    }
    
    
}


struct AdsCard : View {
    
    var ad : AdsModel
    
    
    var body : some View {

            ZStack{
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(ad.title)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black)
                        
                        Text(ad.description)
                            .font(.system(size: 18, weight: .light))
                            .foregroundColor(.black.opacity(0.5))
                        
                        Button {
                            
                        } label : {
                            Text("Order Now")
                                
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .foregroundColor(.white)
                                .background(Color.brown)
                                .cornerRadius(30)
                                .clipShape(Capsule())
                        }
                        .padding(.top, 12)
                    }
                    
                    Spacer()
                    
                    Image(ad.imageURL)
                        .imageScale(.large)
                }
            }
            .padding()
            .frame(width: 380, height: 180)
            .background(ad.color.opacity(0.1))
            .cornerRadius(20)
        
    }
}


struct ProductCard: View {
    
    var product: Product
    
    var body: some View {
        ZStack {
            HStack {
                // Product Image
                Image(product.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120) // Adjust size if needed
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Optional: rounded corners for image
                
                // Product Info
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                        .font(.system(size: 15, weight: .bold))
                    
                    Text("Offer valid today only")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text("20min")
                            .font(.system(size: 12))
                        
                        HStack(spacing: 2) {
                            Text("4.5")
                                .font(.system(size: 12))
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
                        Text(product.price)
                            .font(.system(size: 16, weight: .bold))
                        
                        Text(product.discount)
                            .font(.system(size: 14))
                            .foregroundColor(.red)
                    }
                }
                .padding(.leading, 12)
                
                Spacer()
                
                // Action Buttons
                VStack {
                    Image(systemName: "heart")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                }
                .padding(.trailing, 12)
            }
            .padding()
            .frame(width: 380, height: 150)
            .background(Color.gray.opacity(0.05))
            .cornerRadius(30)
        }
    }
}



#Preview {
    HomeView()
}
