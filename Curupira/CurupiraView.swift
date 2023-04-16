import SwiftUI
import UIKit


struct CurupiraView: View {
    @State var isDragging = false
//    @State private var photoLocation: (CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.80))
    @State private var dropPhoto = Image("")
    @State var curupira = "curupira1"
    @State private var curupiraLocation: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.28 , y: UIScreen.main.bounds.height * 0.50)
    @State private var rectangleLocation: CGPoint = CGPoint(x: UIScreen.main.bounds.width * -0.50, y: UIScreen.main.bounds.height * 0.80)
    @State private var rectangle = Rectangle()
    @State private var dropCompleteCachimbo = false
    @State private var itemHasDroppedCachimbo = false
    @State private var dropCompleteGarrafa = false
    @State private var itemHasDroppedGarrafa = false
    @State private var dropCompleteGorro = false
    @State private var itemHasDroppedGorro = false
    func saciMove() {
        var index = 0
        var count = 0
        //        Timer.publish(every: 0.2, on: .main, in: <#T##RunLoop.Mode#>)
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true ){
            timer in
            curupira = "curupira\(index)"
            index += 1
            
            if(index > 2) {
                index = 1
                count += 1
                if count > 7 {
                    timer.invalidate()
                }
            }
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .center) {
                Image("fundo")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 15)
                VStack {
                    HStack {
                        Spacer(minLength: 50)
                        
                        Image("cachimbo")
                            .resizable()
                            .scaledToFit()
                            .zIndex(1)
                            .draggable("cachimbo"){
                                Image("cachimbo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            }
                            .frame(width: 100, height: 100)
                            .position(x: geo.size.width * 0.40, y: geo.size.height * 0.90 + 280)
                            .opacity(dropCompleteCachimbo ? 0 : 1)
                        Image("garrafa")
                            .resizable()
                            .scaledToFit()
                            .zIndex(1)
                            .draggable("garrafa"){
                                Image("garrafa")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            }
                            .frame(width: 100, height: 100)
                            .position(x: geo.size.width * 0.10, y: geo.size.height * 0.90 + 280)
                            .opacity(dropCompleteGarrafa ? 0 : 1)
                        Image("gorro")
                            .resizable()
                            .scaledToFit()
                            .zIndex(1)
                            .draggable("gorro"){
                                Image("gorro")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 160, height: 160)
                            }
                            .frame(width: 160, height: 160)
                            .position(x: geo.size.width * 0.10, y: geo.size.height * 0.90 + 280)
                            .opacity(dropCompleteGorro ? 0 : 1)
                        Image(curupira)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 600, height: 600)
                            .position(x: geo.size.width * 0.40, y: geo.size.height * 0.76 + 70)
                        rectangle
                            .frame(width: 520,height: 130)
                            .opacity(0.2)
                            .cornerRadius(10)
                            .position(x: geo.size.width * -0.38, y: geo.size.height * 0.90 + 280)
                    }
                }
//                HStack{
//                    VStack{
//                        Text("Saci is a naughty boy who loves to play tricks.")
//                            .frame(width: geo.size.width/2.4)
////                            .padding(EdgeInsets(top: -100, leading: -400, bottom: 400, trailing: 400))
//                            .font(.title)
//
//                        Text("With one leg he comes, by a whirlwind he goes, still carrying a pipe.")
//                            .frame(width: geo.size.width/2.4)
////                            .padding(EdgeInsets(top: -100, leading: -400, bottom: 400, trailing: 400))
//                            .font(.title)
//                        Text("Pra capturá-lo, você pode usar a armadilha com a garrafa.")
//                            .frame(width: geo.size.width/2.4)
//                            .font(.title)
//
//                        Text("Diz a lenda ainda, que tudo que você quiser ele faz, caso consiga pegar seu gorro.")
//                            .frame(width: geo.size.width/2.4)
//                            .font(.title)
//
//
//                    }
//                }
            }
        }
        //        .onAppear{
        //            let screenBounds = UIScreen.main.bounds
        //            photoLocation = CGPoint(x: screenBounds.width * -0.15, y: screenBounds.height * 0.70)
        //        }
        GeometryReader { geo in
            Image("cachimbo")
                .resizable()
                .frame(width: 100, height: 100)
                .blur(radius: itemHasDroppedCachimbo ? 0 : 5)
                .scaledToFit()
                .position(x: geo.size.width * 0.40, y: geo.size.height * 0.50 - 200)
                .dropDestination(for: String.self) { items, location in
                    if let _ = items.first {
                        saciMove()
                        dropCompleteCachimbo = true
                        itemHasDroppedCachimbo = true
                    }
                    return true
                }
            Image("garrafa")
                .resizable()
                .frame(width: 100, height: 100)
                .blur(radius: itemHasDroppedGarrafa ? 0 : 2)
                .scaledToFit()
                .position(x: geo.size.width * 0.30, y: geo.size.height * 0.50 - 200)
                .dropDestination(for: String.self) { items, location in
                    if let _ = items.first {
                        saciMove()
                        dropCompleteGarrafa = true
                        itemHasDroppedGarrafa = true
                    }
                    return true
                }
            Image("gorro")
                .resizable()
                .frame(width: 100, height: 100)
                .blur(radius: itemHasDroppedGorro ? 0 : 5)
                .scaledToFit()
                .position(x: geo.size.width * 0.50, y: geo.size.height * 0.50 - 200)
                .dropDestination(for: String.self) { items, location in
                    if let _ = items.first {
                        saciMove()
                        dropCompleteGorro = true
                        itemHasDroppedGorro = true
                    }
                    return true
                }
        }
    }
    
}
