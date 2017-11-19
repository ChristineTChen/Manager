import React from 'react';
import {PageHeader, Grid, Row, Col, Thumbnail, Button} from 'react-bootstrap';


class Tasks extends React.Component {

	constructor(props) {
		super(props);


		this.state = {

			tasks: []
		}

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

	render() {
      return (
      	<div>
            <PageHeader>Bulletin Board</PageHeader>

            <Grid>
			    <Row>
			    {this.state.tasks.map((task, index) => {
			    	return (
			    		<Col xs={6} md={4} key={index + task.desc}>
					        <Thumbnail>
					          <h3>Task {index + 1}</h3>
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