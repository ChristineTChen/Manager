import React from 'react';
import {PageHeader, Grid, Row, Col, Thumbnail, Button, Form, FormGroup, ControlLabel, FormControl} from 'react-bootstrap';
import moment from 'moment';
import {Socket} from "phoenix";
class Tasks extends React.Component {

	constructor(props) {
		super(props);


		this.state = {

			tasks: []
		}

		this.newTaskEle = null;

		this.createTask = this.createTask.bind(this)

		this.loadTasks();
		let bulletBoard = $("#bulletBoard")

		this.socket = new Socket("/socket")
		this.socket.connect();

		this.channel = this.socket.channel("updates:lobby")
		this.channel.join()
		  .receive("ok", resp => { console.log("Joined successfully", resp) })
		  .receive("error", resp => { console.log("Unable to join", resp) })
		this.channel.on("new_msg", payload => {
			let newTask = `<Col xs={6} md={4} key=${index + payload.task.desc}>
					        <Thumbnail>
					          <h3>Task #${payload.id}</h3>
					          <p>Description: ${payload.desc}</p>
					          <p>Date posted: ${payload.inserted_at}</p>
					          <p>
					            <Button onClick={this.deleteTask.bind(this, task.id)} bsStyle="primary">Completed!</Button>&nbsp;
					          </p>
					        </Thumbnail>
					      </Col>`

			bulletBoard.append(newTask);
			this.loadTasks
		});
	};

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
			    <Row id="bulletBoard">
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