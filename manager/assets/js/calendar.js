// Client ID and API key from the Developer Console
var CLIENT_ID = "113870760288-vjo6vgfavr4gg6tg2s8elm2r8e4qjp2d.apps.googleusercontent.com";
var API_KEY = "AIzaSyCpA-b0Yx6r6Qf2vH2wlYNg8p4Up-oPL18";

// Array of API discovery doc URLs for APIs used by the quickstart
var DISCOVERY_DOCS = ["https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest"];

// Authorization scopes required by the API; multiple scopes can be
// included, separated by spaces.
var SCOPES = "https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/plus.login";

var authorizeButton = document.getElementById('authorize-button');
var signoutButton = document.getElementById('signout-button');
// adding create event button
var createButton = document.getElementById('create-button');


/**
*  On load, called to load the auth2 library and API client library.
*/
function handleClientLoad() {
  gapi.load('client:auth2', initClient);
  // load calendar client library
 // gapi.client.load('calendar', 'v3', handleCreateClick);
  // gapi.client.load('plus', 'v1', logName);
  // console.log("handleClientLoad is called");
}

var GoogleAuth;
/**
*  Initializes the API client library and sets up sign-in state
*  listeners.
*/
function initClient() {
  client2 = gapi.client.init({
    apiKey: API_KEY,
    clientId: CLIENT_ID,
    discoveryDocs: DISCOVERY_DOCS,
    scope: SCOPES
  }).then(function () {
    GoogleAuth = gapi.auth2.getAuthInstance();
    // Listen for sign-in state changes.
    GoogleAuth.isSignedIn.listen(updateSigninStatus);

    // Handle the initial sign-in state.
    updateSigninStatus(GoogleAuth.isSignedIn.get());
    authorizeButton.onclick = handleAuthClick;
    signoutButton.onclick = handleSignoutClick;
    // calling create event
    createButton.onclick = handleCreateClick;
  });
}

/**
*  Called when the signed in status changes, to update the UI
*  appropriately. After a sign-in, the API is called.
*/
function updateSigninStatus(isSignedIn) {
  if (isSignedIn) {
    authorizeButton.style.display = 'none';
    signoutButton.style.display = 'block';
    listUpcomingEvents();
    logName();

  } else {
    authorizeButton.style.display = 'block';
    signoutButton.style.display = 'none';
  }
}

function logName(event) {

  gapi.client.load('plus', 'v1', function () {
    var request = gapi.client.plus.people.get({
      'userId': 'me'
    });

    request.execute(function (resp) {
      console.log(resp);
      alert(resp.displayName);
      alert(resp.emails[0].value);
    })
  })
//   gapi.client.plus.people.list({
//   'userId': 'me',
//   'collection': 'visible'
// }).then(function(res) {
//   var people = res.result;
//   appendPre('Number of people visible to this app: ' +
//       people.totalItems + '<br/>');
//   for (var personIndex in people.items) {
//     person = people.items[personIndex];
//     appendPre('<img src="' + person.image.url + '">');
//   }
// });
}

/**
*  Sign in the user upon button click.
*/
function handleAuthClick(event) {
  GoogleAuth.signIn();
}

/**
*  Sign out the user upon button click.
*/
function handleSignoutClick(event) {
  GoogleAuth.signOut();
}

/**
* Append a pre element to the body containing the given message
* as its text node. Used to display the results of the API call.
*
* @param {string} message Text to be placed in pre element.
*/
function appendPre(message) {
  var pre = document.getElementById('content');
  var textContent = document.createTextNode(message + '\n');
  pre.appendChild(textContent);
}

/**
* Print the summary and start datetime/date of the next ten events in
* the authorized user's calendar. If no events are found an
* appropriate message is printed.
*/
function listUpcomingEvents() {
  //console.log("client "+ gapi.client.calendar.events.list.get());
  gapi.client.calendar.events.list({
    'calendarId': 'primary',
    'timeMin': (new Date()).toISOString(),
    'showDeleted': false,
    'singleEvents': true,
    'maxResults': 10,
    'orderBy': 'startTime',
  }).then(function(response) {
    var events = response.result.items;
    appendPre('Upcoming events:');

    if (events.length > 0) {
      for (i = 0; i < events.length; i++) {
        var event = events[i];
        var when = event.start.dateTime;
        if (!when) {
          when = event.start.date;
        }
        appendPre(event.summary + ' (' + when + ')')
      }
    } else {
      appendPre('No upcoming events found.');
    }
  });
}

/**
*  Create a preset event.
*/
function handleCreateClick(event) {

  var summary = document.getElementById('summary').value;
  var description = document.getElementById('description').value;
  var date = document.getElementById('date').value;
  var start = document.getElementById('start-time').value;
  var end = document.getElementById('end-time').value;
  var attendees = document.getElementById('attendees').value;


  var event = {
    'summary': summary,
    'description': description,
    'start': {
      'dateTime': date + 'T' + start +':00-05:00',
      'timeZone': 'America/New_York'
    },
    'end': {
      'dateTime': date + 'T' + end +':00-05:00',
      'timeZone': 'America/New_York'
    },
  'attendees': [
    {'email': attendees +'@gmail.com'}
  ],
  'reminders': {
    'useDefault': false,
    'overrides': [
      {'method': 'email', 'minutes': 24 * 60},
      {'method': 'popup', 'minutes': 10}
    ]
  }
  };
  var request = gapi.client.calendar.events.insert({
    "calendarId": "primary",
    "resource": event
  });

  request.execute(function(event) {
    console.log("created event " + event);
    appendPre('Event created: ' + event.htmlLink);
  });

}
