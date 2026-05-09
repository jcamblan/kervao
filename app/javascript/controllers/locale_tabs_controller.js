import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "panel"]

  switch(event) {
    event.preventDefault()
    const locale = event.currentTarget.dataset.locale

    this.tabTargets.forEach((tab) => {
      const active = tab.dataset.locale === locale
      tab.classList.toggle("border-gray-900", active)
      tab.classList.toggle("text-gray-900", active)
      tab.classList.toggle("border-transparent", !active)
      tab.classList.toggle("text-gray-500", !active)
    })

    this.panelTargets.forEach((panel) => {
      panel.classList.toggle("hidden", panel.dataset.locale !== locale)
    })
  }
}
