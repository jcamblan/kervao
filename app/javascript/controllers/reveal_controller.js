import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static instance = null

  connect() {
    if (!this.constructor.instance) {
      this.constructor.instance = new IntersectionObserver(
        (entries) => {
          entries.forEach((e) => {
            if (e.isIntersecting) {
              e.target.setAttribute("data-revealed", "1")
              this.constructor.instance.unobserve(e.target)
            }
          })
        },
        { threshold: 0.12, rootMargin: "0px 0px -40px 0px" }
      )
    }
    this.constructor.instance.observe(this.element)
  }

  disconnect() {
    this.constructor.instance?.unobserve(this.element)
  }
}
