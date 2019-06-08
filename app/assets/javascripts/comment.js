// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
class Comment {
    constructor(obj) {
    this.id = obj.id    
    this.content = obj.content   
    this.artist_id = obj.artist_id
    this.created_on = obj.created_on
    }
}

Comment.prototype.commentHTML = function () {
    return (`
    <div>
    <h3> ${this.created_on} </h3>
    <h3> ${this.content} </h3>
    <h3> ${this.artist_id} </h3>
    <div>
    
    
    `)



}

