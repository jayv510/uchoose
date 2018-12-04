import Rails from 'rails-ujs';

export class Chat {
  constructor() {
    this.channel = null;
    this.client = null;
    this.identity = null;
    this.messages = ["Setting up chat ..."];
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
        console.log("Joined channel");
       });
    }
  }

  setupChannel(channel) {
    this.channel = channel;

    var self = this;
    this.channel.getMessages(100).then(function(messages) {
    const totalMessages = messages.items.length;
    for (var i = 0; i < totalMessages; i++) {
      const message = messages.items[i];
      self.addMessage(message);
    }
    });

    this.joinChannel();
    this.addMessage({ body: `Joined chat as ${this.identity}` });
    this.channel.on("messageAdded", message => this.addMessage(message));
    this.setupForm();
  }

  setupClient(client) {
    this.client = client;
    let channelID = document.getElementsByClassName("chat")[0].id;
    console.log(channelID);
    this.client.getChannelByUniqueName(`${channelID}`)
      .then((channel) => this.setupChannel(channel))
      .catch((error) => {
        this.client.createChannel({
          uniqueName: `${channelID}`,
          friendlyName: `Chat ${channelID}`,
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
      html += `<strong><span class="${className}">${message.author}: </span></strong>`;
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

window.Chat = Chat

