//
//  ContentView.swift
//  WeatherApp
//
//  Created by SajithlalDEV on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNightMode = false;
    var nightModeGradient = [.gray,Color.black];
    var lightModeGradient = [.blue,Color("lightBlue")];

    
    var body: some View {
        ZStack{
            
            BackgroundView(isNight: $isNightMode)
            
            VStack(){
                Text("Malappuram, KL")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                VStack(spacing: 0 ){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: 180,height: 180)
                    Text("76°")
                        .font(.system(size: 50,weight: .bold))
                        .foregroundColor(.white)
                }
                Spacer()
                Button{
                    isNightMode.toggle();
                }label: {
                    Text("Change Mode")
                        .foregroundColor(.blue)
                        .font(.system(size: 18,weight: .bold))
                        .frame(width: 240,height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        
                }
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    @Binding var isNight:Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .gray: .blue,isNight ? .black: Color("lightBlue")] ), startPoint: .topLeading, endPoint: .bottomTrailing
        ).ignoresSafeArea()
    }
}
