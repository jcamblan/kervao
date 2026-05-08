import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  remove(event) {
    event.preventDefault()
    const item = event.currentTarget.closest("[data-nested-form-target='container'] > *")
    if (!item) return

    const destroyInput = item.querySelector("input[name*='_destroy']")
    if (destroyInput) {
      destroyInput.value = "1"
      item.classList.add("hidden")
    } else {
      item.remove()
    }
  }
}
