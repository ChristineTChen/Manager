// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

// insert into app.js
import React from 'react';
import ReactDOM from 'react-dom';
import Header from './components/header';
import Tasks from './components/tasks';
import TabMenu from './components/tabs';

function start() {
  let html = <div> 
		  <TabMenu/>
	  </div>;
  let main = document.getElementById('reactstuff');

  ReactDOM.render(html, main);



  // Retrieve teams of user
  let my_manager;
  let manager;

  function fetch_team() {
  	function get_manager(data) {
  		console.log(data);
  		my_manager = data;
  		//manager =
  		

  	}

  	$.ajax({
  		url: path,
  		data: {employee_id: current_user},
  		contentType: "application/json",
  		dataType: "json",
  		method: "GET",
  		success: got_likes,
  	});
  }


}

$(start)