import React from 'react';
import {Navbar, Nav, NavItem, PageHeader, Tabs, Tab} from 'react-bootstrap';
// Attribution: Referred to react-bootstrap documentation

//import './bootstrap.css';
//import './bootstrap-theme.css';
import Tasks from './tasks';

class TabMenu extends React.Component {


   render() {
      console.log('christine y', Tasks)
      debugger
      return (
         <div>

			<Tasks /> 
         </div>
      );
   }
}

export default TabMenu;