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



  // TO JOIN UNIQUE CHANNEL


  // joinChannel() {
  //   if (this.channel.state.status !== "joined") {
  //     this.channel.join().then(function(channel) {
  //       console.log("Joined channel");
  //      });
  //   }
  // }

  // setupChannel(channel) {
  //   this.channel = channel;

  //   var self = this;
  //   this.channel.getMessages(100).then(function(messages) {
  //   const totalMessages = messages.items.length;
  //   for (var i = 0; i < totalMessages; i++) {
  //     const message = messages.items[i];
  //     self.addMessage(message);
  //   }
  //   });

  //   this.joinChannel();
  //   this.addMessage({ body: `Joined chat as ${this.identity}` });
  //   this.channel.on("messageAdded", message => this.addMessage(message));
  //   this.setupForm();
  // }

  // setupClient(client) {
  //   this.client = client;
  //   // let channelID = document.getElementsByClassName("chat")[0].id;
  //   let channelID = 'channel1'
  //   console.log(channelID);
  //   this.client.getChannelByUniqueName(channelID)
  //     .then((channel) => this.setupChannel(channel))
  //     .catch((error) => {
  //       this.client.createChannel({
  //         uniqueName: channelID,
  //         friendlyName: channelID,
  //         // isPrivate: true
  //       }).then((channel) => this.setupChannel(channel));
  //     });
  // }



// TO JOIN GENERAL PUBLIC CHANNEL

  joinChannel() {
    if (this.channel.state.status !== "joined") {
      this.channel.join().then(function(channel) {
        console.log("Joined General Channel");
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
    this.addMessage({ body: `Joined as ${this.identity}` });
    this.channel.on("messageAdded", message => this.addMessage(message));
    this.setupForm();
  }

  setupClient(client) {
    const channelName = 'channel3'   // CHANGE THIS FOR A NEW CHANNEL!

    this.client = client;
    this.client.getChannelByUniqueName(channelName)
      .then((channel) => this.setupChannel(channel))
      .catch((error) => {
        this.client.createChannel({
          uniqueName: channelName,
          friendlyName: "General Chat Channel"
        }).then((channel) => this.setupChannel(channel));
      });
  }

  renderMessages() {
    let messageContainer = document.querySelector(".chat .messages");
    // loop through this.messages and render them
    messageContainer.innerHTML = this.messages
      .map(message => {
        return `<div class="message">${message}</div>`
      })
      .join("");
  }

  addMessage(message) {
    let html = "";

    // console.log(`........................AUTHOR IS ${message.author}`)
    // console.log(message.timestamp)
    if (message.author) {
      const className = message.author == this.identity ? "user me" : "user";
      html += `<div class="${className}"><p>${message.body}</p><p>${message.timestamp.toLocaleTimeString()}</p></div>`;

    }

    // html += message.body;
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

