//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Sydykov Islam on 4/6/21.
//

import SwiftUI

struct MemoryGameView: View {
    
    @ObservedObject var viewModel: EmojyMemoryGame
    
    var body: some View {
        VStack {
            Grid(item: viewModel.cards) { card in
                
                    CardView(card: card).onTapGesture {
                        withAnimation(.linear) {
                            self.viewModel.choose(card: card)
                        }
                        
                    
                    
                }
                .padding(5)

            }
            .foregroundColor(.orange)
            Button(action: {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
                
            }, label: {Text("New Game")})
        }
        
    }
}

struct CardView :View {
    
    var card :MemoryGame<String>.Card
    
    var body :some View {
        
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack(content: {
//                        Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockwise: true)
//                                .padding(5)
//                                .opacity(0.4)
                        Text(card.content)
                            .font(Font.system(size: getFontSize(for: size)))
                            .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                            .animation(Animation.linear(duration: 1))
            })
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    //MARK: - Define Constants
    
    private let cornerRadius = CGFloat(10.0)
    private let emojySizeK = CGFloat(0.7)
    private let strokeLineWidth = CGFloat(3.0)

    func getFontSize(for size: CGSize) -> CGFloat{
        return min(size.width, size.height) * emojySizeK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojyMemoryGame()
        return MemoryGameView(viewModel: game)
        
    }
}
