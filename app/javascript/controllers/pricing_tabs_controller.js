import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "panel"]
  static values = { active: String }

  connect() {
    this.update()
  }

  switch(event) {
    event.preventDefault()
    this.activeValue = event.currentTarget.dataset.reference
    this.update()
  }

  update() {
    this.tabTargets.forEach((tab) => {
      const active = tab.dataset.reference === this.activeValue
      tab.classList.toggle("bg-ink", active)
      tab.classList.toggle("text-bone", active)
      tab.classList.toggle("bg-transparent", !active)
      tab.classList.toggle("text-slate", !active)
    })
    this.panelTargets.forEach((panel) => {
      panel.classList.toggle("hidden", panel.dataset.reference !== this.activeValue)
    })
  }
}
