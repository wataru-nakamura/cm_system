import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div class="memo">${data.content.content}</div>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('comment_content');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
