# Project 3 - MERN Stack Implementation

## Step 0 
Using MobaXterm to ssh into AWS Instance. 
Used public IP, username and public key to connect
```
ssh -i "Lenovo.pem" ubuntu@ec2-54-234-12-227.compute-1.amazonaws.com
```
![0 MobaXterm](https://user-images.githubusercontent.com/80431204/131336981-85795515-1ae6-4f42-a671-8d7ddbf77180.png)

## Step 1 - Backend Configuration

Updating apt package manager
```
sudo apt update
```

![1 sudo apt update](https://user-images.githubusercontent.com/80431204/131337138-2bb465ce-5b34-4fcb-9826-8025377ccb65.png)

Upgrading package manager
```
sudo apt upgrade
```

![1 sudo apt upgrade](https://user-images.githubusercontent.com/80431204/131337185-2265d333-869c-43a0-bdb0-94bcb903da74.png)

Getting the location of node.js software from ubuntu repos
```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```

![1 curl nodejs location](https://user-images.githubusercontent.com/80431204/131337256-1449f41d-c692-4997-8876-8cf79b62b869.png)

Installing Node.js and npn
```
sudo apt-get install -y nodejs
```
![1 sudo apt-get install -y nodesjs](https://user-images.githubusercontent.com/80431204/131337309-0df9943a-aa22-418f-8648-7be9cdb01a8f.png)

Verifying node is installed by retrieving the version
Verifying npm is installed by retrieving the version  
```
node -v
npm -v
```

![1 npm node -v](https://user-images.githubusercontent.com/80431204/131337356-8595b7a2-b25d-437f-a843-a902e8252c96.png)

Make directory for To-Do Project
```
mkdir Todo
```
To list directories/files in the current directory
```
ls
```
To navigate to the created directory 
```
cd Todo
```
![1 mkdir ls cd pwd](https://user-images.githubusercontent.com/80431204/131337550-b4e7f4da-5774-44eb-b275-7f4ec7fa81a7.png)

Create package.json. File will contain info about project and dependencies taht are required for the application to run
```
npm init
```
To confirm 
```
ls
```
![1 npm init ls](https://user-images.githubusercontent.com/80431204/131337676-81d99e1a-f09c-4160-bdec-bf9a4bb2faaa.png)



## Step 2 - Install ExpressJS

Installing ExpressJS
```
npm install express
```


Create index.js file
```
touch index.js
```
Confirm file is created 
```
ls
```
![1 npm install touch index](https://user-images.githubusercontent.com/80431204/131337751-6188065b-e925-4989-b559-d474a335830a.png)

Install dotenv module
```
npm install dotenv
``` 

![1 npm install dotenv](https://user-images.githubusercontent.com/80431204/131337778-88200801-0c47-4db5-a547-875483aedf44.png)

Opens index.js in vim editor
```
vim index.js
``` 
![1 vim indexjs](https://user-images.githubusercontent.com/80431204/131337836-b46e7024-e4ef-4358-865f-32e22abc6343.png)


Inserted code into index file
```
const express = require('express');
require('dotenv').config();

const app = express();

const port = process.env.PORT || 5000;

app.use((req, res, next) => {
res.header("Access-Control-Allow-Origin", "\*");
res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
next();
});

app.use((req, res, next) => {
res.send('Welcome to Express');
});

app.listen(port, () => {
console.log(`Server running on port ${port}`)
});
```

saved and exited vim
```
esc :wq
```

Start the Express server
```
node index.js
```
![1 node index js](https://user-images.githubusercontent.com/80431204/131337938-98e6324d-dbdb-400d-9fcf-3d247d9a6789.png)

Retrieved IP address and DNS
````
curl -s http://169.254.169.254/latest/meta-data/public-ipv4
curl -s http://169.254.169.254/latest/meta-data/public-hostname
```

![1 curl ip and dns](https://user-images.githubusercontent.com/80431204/131338007-c654ddbd-61a4-4af2-b83e-a409d6394af3.png)

Navigated to page with ip address port 5000

![1 aws security group](https://user-images.githubusercontent.com/80431204/131338143-1eb0353b-b05c-4492-a6f7-e4814bcf975c.png)

![1 ip5000](https://user-images.githubusercontent.com/80431204/131338084-a9f5f5c3-a482-4527-83a3-5b212dd398b8.png)

Created routes directory, Changed directory, created api.js file, edited file via vim
```
mkdir routes
cd routes
touch api.js
vim api.js
```

![1 mkdir routes apiJS](https://user-images.githubusercontent.com/80431204/131338241-d9ee47de-e9a5-4101-bb30-250b4be7557e.png)

Added this text to api.js file
```
const express = require ('express');
const router = express.Router();

router.get('/todos', (req, res, next) => {

});

router.post('/todos', (req, res, next) => {

}); 

router.delete('/todos/:id', (req, res, next) => {

})

module.exports = router;
```

![1 vim apijs](https://user-images.githubusercontent.com/80431204/131394198-667d958c-6b68-490d-af1f-31ef079ba338.png)



## Step 3 - Models

We will be using MongoDB which is a NoSQL database so we need to create a model.
A model is the hheart of Javascript apps making it interactive.
This will define the database schema enabling us to define the fields stored in each MongoDB document.
Schema is a blueprint of hwo th e database will be built.

To create the schema and a model we will Install Mongoose in todo dir

```
cd..
npm install mongoose
```

![1 npm install mongoose](https://user-images.githubusercontent.com/80431204/131394323-032f3c38-9a5c-47b9-8954-2c92e5e86526.png)

Create models dir and todo.js in models folder - & executes commands altogether
```
mkdir models && cd models && touch todo.js
```

Edit todo.js file with code
```
vim todo.js
```
![1 mkdir models cd touch vim todojs](https://user-images.githubusercontent.com/80431204/131394467-5f1922c7-9476-48a4-b6cb-af32754ba48f.png)

Copy and paste this text into vim editor
```
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

//create schema for todo
const TodoSchema = new Schema({
action: {
type: String,
required: [true, 'The todo text field is required']
}
})

//create model for todo
const Todo = mongoose.model('todo', TodoSchema);

module.exports = Todo;
``` 

![1 vim todoJS](https://user-images.githubusercontent.com/80431204/131395078-ec5da126-beec-4f2a-b1f7-9403ab0b2434.png)

Navigate to api.js in routes dir and edit/update file with code

```
cd ..
cd routes
vim api.js
:%d ENTER
SHIFT + Insert (Copy and paste of code)


const express = require ('express');
const router = express.Router();
const Todo = require('../models/todo');

router.get('/todos', (req, res, next) => {

//this will return all the data, exposing only the id and action field to the client
Todo.find({}, 'action')
.then(data => res.json(data))
.catch(next)
});

router.post('/todos', (req, res, next) => {
if(req.body.action){
Todo.create(req.body)
.then(data => res.json(data))
.catch(next)
}else {
res.json({
error: "The input field is empty"
})
}
});

router.delete('/todos/:id', (req, res, next) => {
Todo.findOneAndDelete({"_id": req.params.id})
.then(data => res.json(data))
.catch(next)
})

module.exports = router;

esc :wq
```

![1 updated vim api js](https://user-images.githubusercontent.com/80431204/131395147-e1d88037-8a8c-4ccb-9988-d7bdb5661eab.png)

## Step - 3 MongoDB

Signed up to MongoDB via https://www.mongodb.com/atlas-signup-from-mlab

Completed get started steps

Allowed access to the MongoDB database from anywhere

Created a MongoDB database and collection

![Cloud MongoDB IP ](https://user-images.githubusercontent.com/80431204/131395278-d69a489d-3ae6-4eac-9bfb-a76fb7479055.png)
![Cloud MongoDB User](https://user-images.githubusercontent.com/80431204/131395280-0811a005-8323-4410-b6dc-73c7811f06fa.png)

Navigated to todo dir and created .env file
```
touch .env
vim .env
```

![Cloud MongoDB touch vim env](https://user-images.githubusercontent.com/80431204/131395501-f85c4a41-f0ea-498a-b3ec-7efb35ed4235.png)

Added the connection string in this format
```
DB = 'mongodb+srv://<username>:<password>@<network-address>/<dbname>?retryWrites=true&w=majority'
```

![Cloud MongoDB env file](https://user-images.githubusercontent.com/80431204/131395543-37b51abb-9f0b-4e6c-9b18-2804d6e45acc.png)

Got my connection string from Clusters -> Connect
Connect your application
Ensure Node.js is selected as Driver
Copy connection string

Index.js needs to be updated to reflect .env so Node.js can connect to the database
Open the file and delete existing content

```
vim index.js
esc
:%d
ENTER
```

![Cloud MongoDB delete index contents](https://user-images.githubusercontent.com/80431204/131395660-186c73a7-ce12-4bc1-8b7e-85c67db9a6b6.png)

Insert this code
```
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const routes = require('./routes/api');
const path = require('path');
require('dotenv').config();

const app = express();

const port = process.env.PORT || 5000;

//connect to the database
mongoose.connect(process.env.DB, { useNewUrlParser: true, useUnifiedTopology: true })
.then(() => console.log(`Database connected successfully`))
.catch(err => console.log(err));

//since mongoose promise is depreciated, we overide it with node's promise
mongoose.Promise = global.Promise;

app.use((req, res, next) => {
res.header("Access-Control-Allow-Origin", "\*");
res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
next();
});

app.use(bodyParser.json());

app.use('/api', routes);

app.use((err, req, res, next) => {
console.log(err);
next();
});

app.listen(port, () => {
console.log(`Server running on port ${port}`)
});
```

![Cloud MongoDB update index file](https://user-images.githubusercontent.com/80431204/131395809-71926f06-5f5e-48f3-b15d-184c1145f748.png)

Use of env variables to store info is more secure and best practice to seperate config and secret data from the application. Instead of writing connection strings directly inside the index.js app file. This also allows variable to be referenced - if variable was updated you would only need to change in one place rather than each file.

Start server 
```
node index.js
```

![Cloud MongoDB node indexjs successsful connection](https://user-images.githubusercontent.com/80431204/131395901-f26844a7-e47f-45a2-8fa9-ae2179764370.png)

Postman

Install Postman
I've used postman as a QA to do API Testing

![Postman installed](https://user-images.githubusercontent.com/80431204/131396054-897abf7a-01e1-4901-a372-21fdf1830017.png)


POST a task to todo app via Postman
Select POST Method
Insert http://<PublicIP-or-PublicDNS>:5000/api/todos
Headers -> Key = Content-Type || Value = application/json
Body select raw
```
{
    "action":"Add task to todo via Postman"
}
```

![Postman POST Todo](https://user-images.githubusercontent.com/80431204/131396139-f52efabc-2e51-4e94-b6ab-8943ea07dc39.png)

GET tasks posted to todo app
Select GET Method
Insert http://<PublicIP-or-PublicDNS>:5000/api/todos

![Postman GET Todos](https://user-images.githubusercontent.com/80431204/131396172-25fe6c8c-c7c0-462a-8073-89417a71bac3.png)

DELETE tasks posted todo app
Select DELETE Method
Insert http://<PublicIP-or-PublicDNS>:5000/api/todos/<_id>

![Postman DELETE Todo](https://user-images.githubusercontent.com/80431204/131396217-62d6ad97-28cc-42fb-ba08-689406f12d68.png)

Backend and API functionality is now setup

## Step 3 - Frontend Creation 

Time to create a user interface for the Web client (browser) to interact with the application via API. We'll be using the create-react-app to scaffold our application.

In the the same root dir (Todo) run:
```
cd todo
npx create-react-app client
```

![2 FE npx create-react-app client](https://user-images.githubusercontent.com/80431204/131396281-39f98ee0-92df-4203-92f4-a1421d6c9cb0.png)

The command will create a new folder called client in the Todo dir. This is where the react code will go.

Running a react app
Before testing the react application there are some dependencies that need to be installed.

To run a react app there are some dependencies that are required
```
npm install concurrently --save-dev
npm install nodemon --save-dev
```

![2 FE npm concurrently](https://user-images.githubusercontent.com/80431204/131396413-93567b69-cfd9-4696-9617-1b23baf4dffc.png)
![2 FE npm nodemon](https://user-images.githubusercontent.com/80431204/131396418-e021e9eb-1598-475b-92dd-c5e6160b113c.png)

Replace the scripts section in the package.json file of the todo folder.
This script runs the commands to start index then watch using nodemon.

Nodemon:

- monitors for any changes in your Node.js application
- automatically restarts the server,
- saving time and tedious work.

```
cd todo
vim package.json
```

Copy and paste this into vim editor
```
"scripts": {
"start": "node index.js",
"start-watch": "nodemon index.js",
"dev": "concurrently \"npm run start-watch\" \"cd client && npm start\""
},
```

![2 FE scripts packagejson](https://user-images.githubusercontent.com/80431204/131396802-de7a9f5d-a98f-4ed3-aa8d-b573834c264e.png)
configure proxy in client/package.json

```
cd client
vim package.json
```

Add this key value pair to the client/package.json
Adding the proxy config makes access to the application possible directly from the browser by calling a server url as "proxy": "http://localhost:5000" rather than "proxy": "http://localhost:5000/api/todos"
```
"proxy": "http://localhost:5000"
```

![2 FE proxy packagejson update](https://user-images.githubusercontent.com/80431204/131397768-aa0e1dd9-b3cc-4a23-81b5-ef1fa3228b62.png)

`npm run dev` will compile all your assets including a source map. This basically makes it easier to inspect any errors in the developer tools in the console in your browser. 

```
cd ..
npm run dev
```
App should now be running on localhost:3000
In order to access the app on port 3000 we need to add to the AWS security group. Custom TCP needs to be created with port 3000 opened.

### Creating react components

Advantage with react is that it makes use of components which are resulable and makes code modular. For this todo app there will be two stateful compoennts and one stateless

* Stateless components are also called function components in the official React documentation. For this type of component, developers only need to pass one or more “props” (short for “properties”) to the component. The component will then read that property, apply it to the component as needed, and return the result to the body of the interface for display on the user’s screen.

 In React, stateful components have to be defined as classes, rather than functions. The main other difference in using stateful components is that developers must also define the initial value of the state, which can then be modified by the program and add further nuance to the interface the user sees. * **https://rapidapi.com/blog/api-glossary/what-is-react-stateful-vs-stateless-stateful-vs-stateless-explained/**

```
cd client
cd src
mkdir components
touch Input.js ListTodo.js Todo.js
vim input.js
```
![2 FE npm run dev and component file creation](https://user-images.githubusercontent.com/80431204/131397885-d326e415-0502-4042-8e40-70788c1bdd56.png)

Copy and pasted this code into input.js
```
import React, { Component } from 'react';
import axios from 'axios';

class Input extends Component {

state = {
action: ""
}

addTodo = () => {
const task = {action: this.state.action}

    if(task.action && task.action.length > 0){
      axios.post('/api/todos', task)
        .then(res => {
          if(res.data){
            this.props.getTodos();
            this.setState({action: ""})
          }
        })
        .catch(err => console.log(err))
    }else {
      console.log('input field required')
    }

}

handleChange = (e) => {
this.setState({
action: e.target.value
})
}

render() {
let { action } = this.state;
return (
<div>
<input type="text" onChange={this.handleChange} value={action} />
<button onClick={this.addTodo}>add todo</button>
</div>
)
}
}

export default Input
```

![2 FE vim inputJS](https://user-images.githubusercontent.com/80431204/131398078-1bf07e3a-54fa-4759-8266-2289d0532f30.png)


Next step is to install axios in the clients dir
Axios is a Promise based HTTP client for the browser and node.js.
`yarn add axios` or `npm install axios` can noth be used to install axios 
```
cd ..
cd ..
npm install axios
```

![2 FE npm install axios](https://user-images.githubusercontent.com/80431204/131398129-746bf47c-1c39-4a06-9715-4109cf7f3cf8.png)

Navigate to the components dir and open vi editor for ListTodo.js
```
cd src/components
vi ListTodo.js
```

Copy and paste this code into ListTodo.js
```
import React from 'react';

const ListTodo = ({ todos, deleteTodo }) => {

return (
<ul>
{
todos &&
todos.length > 0 ?
(
todos.map(todo => {
return (
<li key={todo._id} onClick={() => deleteTodo(todo._id)}>{todo.action}</li>
)
})
)
:
(
<li>No todo(s) left</li>
)
}
</ul>
)
}

export default ListTodo
```

![2 FE vim ListTodoJS](https://user-images.githubusercontent.com/80431204/131398207-24dfb28a-8845-4c5f-b8b3-bccb415183b9.png)

Open Todo.js copy and paste the below code
```
import React, {Component} from 'react';
import axios from 'axios';

import Input from './Input';
import ListTodo from './ListTodo';

class Todo extends Component {

state = {
todos: []
}

componentDidMount(){
this.getTodos();
}

getTodos = () => {
axios.get('/api/todos')
.then(res => {
if(res.data){
this.setState({
todos: res.data
})
}
})
.catch(err => console.log(err))
}

deleteTodo = (id) => {

    axios.delete(`/api/todos/${id}`)
      .then(res => {
        if(res.data){
          this.getTodos()
        }
      })
      .catch(err => console.log(err))

}

render() {
let { todos } = this.state;

    return(
      <div>
        <h1>My Todo(s)</h1>
        <Input getTodos={this.getTodos}/>
        <ListTodo todos={todos} deleteTodo={this.deleteTodo}/>
      </div>
    )

}
}

export default Todo;
```
![2 FE vim TodoJS](https://user-images.githubusercontent.com/80431204/131402057-ec29b6c6-38de-4d8f-b746-34e8d1e9ff0a.png)



Adjustment to the react code is need. To delete the logo and adjust the look of the application

Navigate to src folder and open vi editor for App.js

```
cd ..
vi App.js
```

![2 FE navigate to appJS](https://user-images.githubusercontent.com/80431204/131402117-55130419-c7ae-431a-b999-bd3481b14f2e.png)


Copy and paste the below code into App.js
```
import React from 'react';

import Todo from './components/Todo';
import './App.css';

const App = () => {
return (
<div className="App">
<Todo />
</div>
);
}

export default App;
```

![2 FE vim appJS](https://user-images.githubusercontent.com/80431204/131402154-7cd5a829-229f-4b5e-8ece-a4491170940b.png)


Open the App.css with vim editor
```
vim App.css
```

Copy and paste the below code into the editor
```
.App {
text-align: center;
font-size: calc(10px + 2vmin);
width: 60%;
margin-left: auto;
margin-right: auto;
}

input {
height: 40px;
width: 50%;
border: none;
border-bottom: 2px #101113 solid;
background: none;
font-size: 1.5rem;
color: #787a80;
}

input:focus {
outline: none;
}

button {
width: 25%;
height: 45px;
border: none;
margin-left: 10px;
font-size: 25px;
background: #101113;
border-radius: 5px;
color: #787a80;
cursor: pointer;
}

button:focus {
outline: none;
}

ul {
list-style: none;
text-align: left;
padding: 15px;
background: #171a1f;
border-radius: 5px;
}

li {
padding: 15px;
font-size: 1.5rem;
margin-bottom: 15px;
background: #282c34;
border-radius: 5px;
overflow-wrap: break-word;
cursor: pointer;
}

@media only screen and (min-width: 300px) {
.App {
width: 80%;
}

input {
width: 100%
}

button {
width: 100%;
margin-top: 15px;
margin-left: 0;
}
}

@media only screen and (min-width: 640px) {
.App {
width: 60%;
}

input {
width: 50%;
}

button {
width: 30%;
margin-left: 10px;
margin-top: 0;
}
}
```
![2 FE vim appCSS](https://user-images.githubusercontent.com/80431204/131402288-34ec2a17-2667-4b89-ab4f-283a89a2d75d.png)


In src dir open the index.css
```
vim index.css
```

Copy and paste the below code into the editor
```
body {
margin: 0;
padding: 0;
font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen",
"Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue",
sans-serif;
-webkit-font-smoothing: antialiased;
-moz-osx-font-smoothing: grayscale;
box-sizing: border-box;
background-color: #282c34;
color: #787a80;
}

code {
font-family: source-code-pro, Menlo, Monaco, Consolas, "Courier New",
monospace;
}
```

![2 FE vim indexCSS](https://user-images.githubusercontent.com/80431204/131402341-0e5df770-4e64-42d8-988e-ef2e5843a8e8.png)

Navigate to the Todo dir
```
cd ../..
```

Confirm you're in the Todo dir To run the application
```
npm run dev
```
![2 FE vim appJS appCSS indexCSS npm run dev ](https://user-images.githubusercontent.com/80431204/131402452-22a26b09-f3a3-4ff9-bc24-0c997987bd11.png)

![2 FE npm run dev SUCCESS](https://user-images.githubusercontent.com/80431204/131402456-00429146-c7d6-4c95-a05b-e20d2cbad3a6.png)

![2 FE Browser ip port 3000](https://user-images.githubusercontent.com/80431204/131402458-ac40663a-11e5-43a9-a142-ad7dfc0f7e77.png)





