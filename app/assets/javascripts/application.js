//= require rails-ujs
//= require_tree .

Rails.ajax({
  url: "/tokens",
  type: "POST",
  success: function(data) {
    console.log(data);
  }
});
