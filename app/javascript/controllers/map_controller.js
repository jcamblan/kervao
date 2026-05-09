import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    latitude: Number,
    longitude: Number,
    zoom: { type: Number, default: 13 },
    label: String,
  }

  connect() {
    this.initIfReady()
  }

  initIfReady() {
    if (window.L) {
      this.render()
    } else {
      // Leaflet's UMD <script defer> may not be loaded yet at first connect.
      this.timeout = setTimeout(() => this.initIfReady(), 50)
    }
  }

  render() {
    const L = window.L
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
    if (this.timeout) clearTimeout(this.timeout)
    this.map?.remove()
  }
}
