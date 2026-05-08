import { Controller } from "@hotwired/stimulus"
import L from "leaflet"

export default class extends Controller {
  static values = {
    latitude: Number,
    longitude: Number,
    zoom: { type: Number, default: 10 },
    label: String,
  }

  connect() {
    const center = [this.latitudeValue, this.longitudeValue]
    this.map = L.map(this.element).setView(center, this.zoomValue)

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
      maxZoom: 19,
    }).addTo(this.map)

    const marker = L.marker(center).addTo(this.map)
    if (this.hasLabelValue) {
      marker.bindPopup(this.labelValue).openPopup()
    }
  }

  disconnect() {
    this.map?.remove()
  }
}
