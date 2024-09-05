//
//  ContentView.swift
//  appSwiftUI
//
//  Created by braulio on 09/06/24.
//  Copyright © 2024 braulio. All rights reserved.
//
import SwiftUI

struct emojiFrutas: Identifiable {
    let id = UUID()
    let emoji: String
    let nombre: String
    let descripcion: String
    let comida: String
    let costoViaje: String
    let imagen: Image
}

private let listaEmojis: [emojiFrutas] = [
    emojiFrutas(emoji: "🇹🇭", nombre: "Bangkok, Tailandia", descripcion: "Conocida por sus templos ornamentados, vida nocturna vibrante y mercados flotantes.", comida: "Pad Thai: Fideos de arroz salteados con camarones, tofu, maní, huevo y brotes de soja, sazonados con salsa de tamarindo.", costoViaje: "Total aproximado: $1,200 - $2,200", imagen: Image("bangkok")),
    emojiFrutas(emoji: "🇫🇷", nombre: "París, Francia", descripcion: "Famosa por la Torre Eiffel, el Museo del Louvre, la Catedral de Notre-Dame y su ambiente romántico.", comida: "Croissant: Un panecillo hojaldrado y mantecoso, ideal para el desayuno.\nCoq au Vin: Pollo cocido a fuego lento en vino tinto, con champiñones, panceta y cebolla.", costoViaje: "Total aproximado: $1,700 - $3,200", imagen: Image("paris")),
    emojiFrutas(emoji: "🇬🇧", nombre: "Londres, Reino Unido", descripcion: "Hogar del Big Ben, el Palacio de Buckingham, el Museo Británico y el Támesis.", comida: "Fish and Chips: Pescado empanizado y frito, servido con papas fritas y a menudo acompañado de guisantes triturados.\nSunday Roast: Carne asada (generalmente de res), acompañada de papas asadas, verduras y Yorkshire pudding.", costoViaje: "Total aproximado: $1,700 - $3,200", imagen: Image("londres")),
    emojiFrutas(emoji: "🇦🇪", nombre: "Dubái, Emiratos Árabes Unidos", descripcion: "Conocida por su arquitectura moderna, centros comerciales de lujo y el Burj Khalifa.", comida: "Al Harees: Un plato tradicional de trigo y carne, cocido lentamente hasta obtener una consistencia similar a la de un puré. \nShawarma: Finas lonchas de carne de cordero, pollo o ternera, servidas en pan pita con ensaladas y salsas.", costoViaje: "Total aproximado: $1,800 - $3,300", imagen: Image("dubai")),
    emojiFrutas(emoji: "🇸🇬", nombre: "Singapur", descripcion: "Destacada por su limpieza, modernidad, Marina Bay Sands y los jardines de la bahía.", comida: "Hainanese Chicken Rice: Pollo hervido servido con arroz cocido en caldo de pollo y acompañado de salsas y pepino. \nChilli Crab: Cangrejo cocido en una salsa espesa de tomate y chile, ligeramente dulce y picante.", costoViaje: "Total aproximado: $1,600 - $2,800", imagen: Image("singapur")),
    emojiFrutas(emoji: "🇺🇸", nombre: "Nueva York, Estados Unidos", descripcion: "Conocida por la Estatua de la Libertad, Times Square, Central Park y Broadway.", comida: "Bagel con Salmón Ahumado: Un pan circular hervido y horneado, generalmente untado con queso crema y acompañado de salmón ahumado.\nNew York Pizza: Pizza de masa fina, con una gran variedad de toppings, famosa por su gran tamaño.", costoViaje: "Total aproximado: $1,800 - $3,700", imagen: Image("newYork")),
    emojiFrutas(emoji: "🇲🇾", nombre: "Kuala Lumpur, Malasia", descripcion: "Famosa por las Torres Petronas, mercados callejeros y diversidad cultural.", comida: "Nasi Lemak: Arroz cocido en leche de coco, acompañado de anchoas fritas, huevo duro, cacahuetes, sambal (salsa picante) y carne o pollo. \nSatay: Brochetas de carne marinada y asada, servidas con una salsa de cacahuate.", costoViaje: "Total aproximado: $1,200 - $2,200", imagen: Image("kuala")),
    emojiFrutas(emoji: "🇯🇵", nombre: "Tokio, Japón", descripcion: "Reconocida por su tecnología avanzada, cultura pop, templos antiguos y gastronomía.", comida: "Sushi: Arroz avinagrado acompañado de pescado crudo, mariscos y vegetales. \nRamen: Sopa de fideos con caldo, a menudo acompañada de carne, huevo y verduras.", costoViaje: "Total aproximado: $1,800 - $3,400", imagen: Image("tokio")),
    emojiFrutas(emoji: "🇹🇷", nombre: "Estambul, Turquía", descripcion: "Ofrece una mezcla única de historia europea y asiática, con lugares como Santa Sofía y el Bazar de las Especias.", comida: "Kebabs: Carne asada en un pincho, servida en pan o en un plato con arroz y ensaladas. \nBaklava: Un postre de capas de masa filo, relleno de nueces y bañado en almíbar.", costoViaje: "Total aproximado: $1,400 - $2,700", imagen: Image("estambul")),
    emojiFrutas(emoji: "🇮🇹", nombre: "Roma, Italia", descripcion: "Llena de historia, con el Coliseo, el Vaticano y la Fontana de Trevi.", comida: "Pasta Carbonara: Pasta (generalmente espaguetis) con una salsa de huevo, queso Pecorino Romano, panceta y pimienta. \nGelato: Helado italiano, más denso y sabroso que el helado convencional, disponible en una gran variedad de sabores.", costoViaje: "Total aproximado: $1,600 - $2,900", imagen: Image("roma"))
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(listaEmojis) { emojiFruta in
                NavigationLink(destination: detallesView(emojiFruta: emojiFruta)) {
                    HStack {
                        emojiCirculoVista(emojiFruta: emojiFruta)
                        Text(emojiFruta.nombre).font(.headline)
                    }.padding(5)
                }
            }
            .navigationBarTitle("🎌Top 10 World Cities🎌")
        }
    }
}

struct detallesView: View {
    let emojiFruta: emojiFrutas
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                emojiCirculoVista(emojiFruta: emojiFruta).padding()
                Text(emojiFruta.nombre)
                    .font(.largeTitle)
                    .bold()
            }
            emojiFruta.imagen
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()
            Text("Descripción").bold().italic().padding(.top)
            Text(emojiFruta.descripcion).padding(.top)
            Text("Comida Típica").bold().italic().padding(.top)
            Text(emojiFruta.comida).padding(.top)
            Text("Costo Viaje").bold().italic().padding(.top)
            Text(emojiFruta.costoViaje).padding(.top)
        }
        .padding()
        .navigationBarTitle(Text(emojiFruta.nombre), displayMode: .large)
    }
}

struct emojiCirculoVista: View {
    let emojiFruta: emojiFrutas
    var body: some View {
        ZStack {
            Text(emojiFruta.emoji).shadow(radius: 5)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(Circle().stroke(Color.green, lineWidth: 3))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
