import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["track"]

  next() {
    this.scroll(1)
  }

  prev() {
    this.scroll(-1)
  }

  scroll(direction) {
    const track = this.trackTarget
    const child = track.firstElementChild
    if (!child) return
    const step = child.getBoundingClientRect().width + 16 // gap-4
    track.scrollBy({ left: step * direction, behavior: "smooth" })
  }
}
