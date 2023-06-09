import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { realtyId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "RealtyChannel", id: this.realtyIdValue },
      //{ received: data => console.log(data) }
      { received: data => this._insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the realty with the id ${this.realtyIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the realty")
    this.channel.unsubscribe()
  }

  _insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
  resetForm(event) {
    event.target.reset()
  }
}
