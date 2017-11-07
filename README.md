# CS4550 Project: Manager Web App

### Team: Christine Chen & Rosaline (Ruisi) Su

Github Repo: https://github.com/ChristineTChen/Manager.git
Domain: project.christinetchen.com

Project Status: Manager app

  The project is still in it’s early stages of development. Our project progress has been delayed because we spent a significant amount of time trying to understand the documentation of the new frameworks and libraries, like OAuth and ReactJS, we are using in this web application. Currently, logging in with a Google account works and creating the relationships between employees, managers and teams. Our application is also able to handle messages like broadcasts and task assignments. 
  
  Some problems we are running into are: showing proofs to access the Google Calendar API, add event to the calendar; which then leads to potentially rendering the Google calendar, and adding shifts to the said calendar. Managers are suppose to assign shifts to users. However, our original plan was to have managers edit the shifts for a specific employee. This becomes a design problem because it will be more difficult for managers to access the employee’s account for the third party service.
  
  Therefore, we are planning to render one calendar for the manager and allow the manager to select employees and creating time blocks of shifts (Google Cal events) that are owned by the manager. Having the corresponding employee as the attendee allows notifications and communications with the employee regarding the assigned shift. We will then send the shift request to the manager’s Google calendar. This way, managers will have a better and easier-to-use interface and user’s will be notified of shift requests on their calendar.
 
 
Experiment Repository: https://github.com/gummybear1202/CS4550_ProjectExp


