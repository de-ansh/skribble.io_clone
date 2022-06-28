const express = require("express");
var http = require("http");
const app = express();

const port= process.env.port || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
var io = require("socket.io")(server);


//middleware
app.use(express.json());

//connecting to database
const DB = 'mongodb+srv://pythonbot:Mongodb45@cluster0.mwle23f.mongodb.net/?retryWrites=true&w=majority'

mongoose.connect(DB).then(() =>{
    console.log('Connection succesful')
}).catch((e) =>{
    console.log(e);
})


server.listen(port, "0.0.0.0",() =>{
    console.log('Server Started and Finishing on port'+ port);
} )

//50