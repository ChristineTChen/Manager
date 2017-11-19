import React from 'react';
import {PageHeader, Grid, Row, Col, Thumbnail, Button, Form, FormGroup, ControlLabel, FormControl} from 'react-bootstrap';
import moment from 'moment';
class Tasks extends React.Component {

	constructor(props) {
		super(props);


		this.state = {

			tasks: []
		}

		this.newTaskEle = null;

		this.createTask = this.createTask.bind(this)

		this.loadTasks();
	}

	loadTasks() {
	  	$.ajax({
	  		url: '/api/v1/tasks',
	  		dataType: "json",
	  		method: "GET",
	  		success: (resp) => {
	  			this.setState({
	  				tasks: resp.data 
	  			})
	  		},
	  	});
	}

	deleteTask(taskId) {
	  	$.ajax({
	  		url: '/api/v1/tasks/' + taskId,
	  		dataType: "json",
	  		method: "DELETE",
	  		success: (resp) => {
	  			this.setState({
	  				tasks: resp.data 
	  			})
	  		},
	  	});
	}

	createTask() {
		let data = {task: {
			manager_id: 2,
			assignee_id: window.current_user_id,
			desc: this.newTaskEle.value,
		}};
		$.ajax({
			url: '/api/v1/tasks',
			dataType: "json",
      		contentType: "application/json",
			data:  JSON.stringify(data),
			method: "POST",
			success: this.loadTasks,
		})
	}

	render() {
	if (!window.user_name){
		return null;
	}
	console.log('render')

      return (
      	<div>
            <PageHeader>Bulletin Board</PageHeader>
			 

			 <Form inline>
			    <FormGroup controlId="formInlineName">
			      <ControlLabel>New Task</ControlLabel>
			      <FormControl inputRef = {(element) => {this.newTaskEle = element}} type="text" placeholder="Task description" />
			    </FormGroup>
			    <Button onClick={this.createTask} >
			      Post Task
			    </Button>
			  </Form>

            <Grid>
			    <Row>
			    {this.state.tasks.map((task, index) => {
			    	return (
			    		<Col xs={6} md={4} key={index + task.desc}>
					        <Thumbnail>
					          <h3>Task #{task.id}</h3>
					          <p>Description: {task.desc}</p>
					          <p>Date posted: {task.inserted_at}</p>
					          <p>
					            <Button onClick={this.deleteTask.bind(this, task.id)} bsStyle="primary">Completed!</Button>&nbsp;
					          </p>
					        </Thumbnail>
					      </Col>
					      )
			    })}
			    
			    </Row>
			</Grid>
		</div>
      );
   }
}

export default Tasks;