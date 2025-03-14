import SwiftUI
import MapKit
import CoreLocation

struct MapViewWithTap: UIViewRepresentable {
    @Binding var tappedLocation: CLLocationCoordinate2D?
    @Binding var placeName: String

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let gestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        mapView.addGestureRecognizer(gestureRecognizer)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        let parent: MapViewWithTap

        init(_ parent: MapViewWithTap) {
            self.parent = parent
        }

        @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
            guard let mapView = gestureRecognizer.view as? MKMapView else { return }
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)

            // Update tappedLocation
            parent.tappedLocation = coordinate

            // Reverse geocode to get place name
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    self.parent.placeName = "Unable to find place name"
                } else if let placemark = placemarks?.first {
                    self.parent.placeName = placemark.name ?? "Unknown Place"
                }
            }
        }
    }
}

struct MapWithTapExample: View {
    @State private var tappedLocation: CLLocationCoordinate2D? = nil
    @State private var placeName: String = "Tap on the map to get the location name"

    var body: some View {
        VStack {
            MapViewWithTap(tappedLocation: $tappedLocation, placeName: $placeName)
                .frame(height: 600)
            
            if let location = tappedLocation {
                Text("Coordinates: \(location.latitude), \(location.longitude)")
                    .font(.subheadline)
                    .padding()
            }

            Text(placeName)
                .font(.title3)
                .foregroundColor(.blue)
                .padding()
        }
    }
}

#Preview {
    MapWithTapExample()
}

