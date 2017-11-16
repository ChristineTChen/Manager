import React from 'react';
import {Navbar, Nav, NavItem, PageHeader, Tabs, Tab} from 'react-bootstrap';
// Attribution: Referred to react-bootstrap documentation

//import './bootstrap.css';
//import './bootstrap-theme.css';
import Tasks from './tasks';

class TabMenu extends React.Component {


   render() {
      return (
         <div>
            <Navbar>
            	<Navbar.Header>
            		<Navbar.Brand>	
            			<a href="#"> Manager App </a>
            		</Navbar.Brand>
            	</Navbar.Header>
	            <Nav pullRight>
	            	<NavItem eventKey={1} href='#'> View Profile </NavItem>
	            </Nav>
            </Navbar>

			<Tabs defaultActiveKey={1} animation={false} id="noanim-tab-example">
				<Tab eventKey={1} title="Assigned Tasks"> <Tasks /> </Tab>
			    <Tab eventKey={2} title="View Schedule"> </Tab>
			    <Tab eventKey={3} title="View Team"> View Team </Tab>
			</Tabs>

         </div>
      );
   }
}

export default TabMenu;