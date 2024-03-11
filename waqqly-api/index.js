const express = require("express");
const bodyParser = require("body-parser");
const { MongoClient } = require("mongodb");
require("dotenv").config();

const jsonParser = bodyParser.json();
const app = express();

const MongoDBClient = new MongoClient(process.env.URL);

app.listen(3001, () => {
  console.log("Server running on port 3001");
});

app.post("/post-walkers", jsonParser, async (req, res, next) => {
  await MongoDBClient.connect();
  const db = MongoDBClient.db("waqqly-db");
  const collection = db.collection("walkers");
  const result = await collection.insertOne(req.body);

  res.sendStatus(200);
});

app.post("/post-pets", jsonParser, async (req, res, next) => {
  await MongoDBClient.connect();
  const db = MongoDBClient.db("waqqly-db");
  const collection = db.collection("dogs");
  const result = await collection.insertOne(req.body);

  res.sendStatus(200);
});

app.get("/get-walkers", async (req, res, next) => {
  await MongoDBClient.connect();
  const db = MongoDBClient.db("waqqly-db");
  const collection = db.collection("walkers");
  const result = await collection.find({}).toArray();

  res.json(result);
});

app.get("/get-pets", async (req, res, next) => {
  await MongoDBClient.connect();
  const db = MongoDBClient.db("waqqly-db");
  const collection = db.collection("dogs");
  const result = await collection.find({}).toArray();

  res.json(result);
});
