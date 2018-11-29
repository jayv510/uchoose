export class Chat {
  constructor() {
    this.channel = null;
    this.client = null;
    this.identity = null;
    this.messages = ["Preparing your chat! ..."];
    this.initialize();
  }

  initialize() {
    this.renderMessages();

    Rails.ajax({
      url: "/tokens",
      type: "POST",
      success: data => {
        this.identity = data.identity;
        Twilio.Chat.Client
          .create(data.token)
          .then(client => this.setupClient(client));
      }
    });
  }

  joinChannel() {
    if (this.channel.state.status !== "joined") {
      this.channel.join().then(function(channel) {
        console.log("Joined General Channel");
       });
    }
  }

  setupChannel(channel) {
    this.channel = channel;
    console.log(channel)
    this.joinChannel();
    this.addMessage({ body: `Joined general channel as ${this.identity}` });
    this.channel.on("messageAdded", message => this.addMessage(message));
    this.setupForm();
  }

  setupClient(client) {
    this.client = client;
    this.client.getChannelByUniqueName("general")
      .then((channel) => this.setupChannel(channel))
      .catch((error) => {
        this.client.createChannel({
          uniqueName: "general",
          friendlyName: "General Chat Channel",
          isPrivate: true
        }).then((channel) => this.setupChannel(channel));
      });
  }

  renderMessages() {
    let messageContainer = document.querySelector(".chat .messages");
    messageContainer.innerHTML = this.messages
      .map(message => `<div class="message">${message}</div>`)
      .join("");
  }

  addMessage(message) {
    let html = "";

    if (message.author) {
      const className = message.author == this.identity ? "user me" : "user";
      html += `<span class="${className}">${message.author}: </span>`;
    }

    html += message.body;
    this.messages.push(html);
    this.renderMessages();
  }

  setupForm() {
    const form = document.querySelector(".chat form");
    const input = document.querySelector(".chat form input");

    form.addEventListener("submit", event => {
      event.preventDefault();
      this.channel.sendMessage(input.value);
      input.value = "";
      return false;
    })
  }

  // inviteFriends() {
  //   myChannel.invite('elmo').then(function() {
  //     console.log('Your friend has been invited!');
  //   })
  // }
};
