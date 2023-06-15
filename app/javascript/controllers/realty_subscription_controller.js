import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { realtyId: Number, userId: Number, lastMessageId: Number }
  static targets = ["messages"]

  connect() {
    console.log("test");
    const lastMessage = document.querySelector(`#message-${this.lastMessageIdValue}`)
    setTimeout(() => {
      lastMessage.scrollIntoView()
    }, 300);
    console.log(this.lastMessageIdValue);
    // this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
    console.log(this.messagesTarget.scrollHeight);

    this.channel = createConsumer().subscriptions.create(
      { channel: "RealtyChannel", id: this.realtyIdValue },
      { received: data => this._insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the realty with the id ${this.realtyIdValue}.`)
    console.log(`Vous avez l'id: ${this.userIdValue}`)
  }

  disconnect() {
    console.log("Unsubscribed from the realty")
    this.channel.unsubscribe()
  }

  _insertMessageAndScrollDown(data) {
    let div = document.createElement('div');
    div.id = `message-${data.message.id}`;
    div.classList.add("message");

    if (data.sender_id == this.userIdValue) {
      div.classList.add("current-user");
    }

    div.innerHTML = data.message.content;

    this.messagesTarget.appendChild(div);
    div.scrollIntoView()
  }

  resetForm(event) {
    event.currentTarget.reset();
  }
}


  // _insertMessageAndScrollDown(data) {
  //   let div = document.createElement('div');
  //   div.id = `message-${data.message.id}`

  //   if (data.sender_id == this.userIdValue) {
  //     console.log("Je viens d'envoyer le message : ", data.message)
  //     div.classList.add('align-self-end', 'text-end',"message-bubble", 'message-content','message-user','message-details');
  //   }

  //   let small = document.createElement('small')
  //   let strong = document.createElement('strong')
  //   let i = document.createElement('i')
  //   let p = document.createElement('p')

  //   strong.innerHTML = data.sender_name
  //   i.innerHTML = data.date
  //   p.innerHTML = data.message.content

  //   small.appendChild(strong)
  //   small.appendChild(i)
  //   div.appendChild(small)
  //   div.appendChild(p)

  //   this.messagesTarget.appendChild(div)
  //   this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  // }
//   resetForm(event) {
//     event.target.reset();
//   }
// }
