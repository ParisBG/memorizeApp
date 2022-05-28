//
//  ContentView.swift
//  Memorize
//
//  Created by Paris G on 5/1/22.
//

import SwiftUI

struct TcContentView: View {
    @State var emojis = TcCardDeckSelector(deckType: 5)

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "brain.head.profile")
                Text("P's Memorize!").font(.largeTitle)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count], id:\.self){ emoji in TcCardView(content: emoji) }
                }
            }.foregroundColor(.green)
            HStack {
                //Spacer()
                carButton
                truckButton
                aircraftButton
                cycleButton
                boatButton
                trainButton
            }
        }.padding(.horizontal)
    }
    var carButton: some View {
        Button(action: {
            emojis = TcCardDeckSelector(deckType: 0)
            
        }, label: {
            VStack {
                Text("Cars").font(.caption2)
                Image(systemName: "car")
            }
            .frame(width: 47, height: 60)
            .foregroundColor(Color.black)
            .background(Color.green)
            .clipShape(Circle())
        })
    }
    var truckButton: some View {
        Button(action: {
            emojis = TcCardDeckSelector(deckType: 1)
            
        }, label: {
            VStack {
                Text("Trucks").font(.caption2)
                Image(systemName: "bus")
            }
            .frame(width: 47, height: 60)
            .foregroundColor(Color.black)
            .background(Color.green)
            .clipShape(Circle())
        })
    }
    var aircraftButton: some View {
        Button(action: {
            emojis = TcCardDeckSelector(deckType: 2)
            
        }, label: {
            VStack {
                Text("Planes").font(.caption2)
                Image(systemName: "airplane")
            }
            .frame(width: 47, height: 60)
            .foregroundColor(Color.black)
            .background(Color.green)
            .clipShape(Circle())
        })
    }
    var cycleButton: some View {
        Button(action: {
            emojis = TcCardDeckSelector(deckType: 3)

        }, label: {
            VStack {
                Text("Bikes").font(.footnote)
                Image(systemName: "bicycle")
            }
            .frame(width: 47, height: 60)
            .foregroundColor(Color.black)
            .background(Color.green)
            .clipShape(Circle())
        })
    }
    var boatButton: some View {
        Button(action: {
            emojis = TcCardDeckSelector(deckType: 4)

        }, label: {
            VStack {
                Text("Boats").font(.footnote)
                Image(systemName: "ferry")
            }
            .frame(width: 47, height: 60)
            .foregroundColor(Color.black)
            .background(Color.green)
            .clipShape(Circle())
        })
    }
    var trainButton: some View {
        Button(action: {
            emojis = TcCardDeckSelector(deckType: 5)

        }, label: {
            VStack {
                Text("Trains").font(.footnote)
                Image(systemName: "tram")
            }
            .frame(width: 47, height: 60)
            .foregroundColor(Color.black)
            .background(Color.green)
            .clipShape(Circle())
        })
    }


    }

func TcCardDeckSelector(deckType: Int) -> Array<String> {
    let cars : [String] = ["🚗","🚕","🏎","🚓","🚔","🚘","🚖","🚥"]
    let trucks : [String] = ["🚙","🚌","🚎","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚍"]
    let aircraft : [String] = ["✈️","🚀","🚡","🛰","🚁","🛸","🛩","🛬","🛫"]
    let cycles : [String] = ["🚲","🛵","🏍","🦽","🦼","🛴","🦯","🛺"]
    let boats : [String] = ["🛳","⛵️","🛶","🚤","🛥","⛴","🚢","⚓️"]
    let trains : [String] = ["🚉","🚊","🚇","🚆","🚂","🚈","🚅","🚄","🚝","🚞","🚋","🚃","🚟","🚠","🚡"]
    
    let allDecks : [Array<String>] = [cars, trucks, aircraft, cycles, boats, trains]
    //randomInt = Int.random(in: 0..<6)
        
    return(allDecks[deckType].shuffled())

}
    
struct TcCardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
         
    }
 }


struct TcContentView_Previews: PreviewProvider {
    static var previews: some View {
        TcContentView().preferredColorScheme(.dark)
        //TcContentView(viewModel: game).preferredColorScheme(.light)
    }
}

