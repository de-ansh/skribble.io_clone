const express = require("express");
var http = require("http");
const app = express();
const Room = require('./models/Room');
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

io.on('connection',(socket)=>{
    console.log('connected');
    socket.on('create-game', async({nickname,name,occupancy,maxRounds})=>{
        try{
            const existingRoom= await Room.findOne({name});
            if(existingRoom){
                socket.exit('notCorrectGame', 'Room with the same name already exists!');
                return;
            }
            let room = new Room();
            const word = getword();
        }catch(err){

        }
    })
})

server.listen(port, "0.0.0.0",() =>{
    console.log('Server Started and Finishing on port'+ port);
} )



