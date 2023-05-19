var admin = require("firebase-admin");

var serviceAccount = require("./service_key.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const firestore = admin.firestore();
const path = require("path");
const fs = require("fs");
const filePath = path.join(__dirname, "tests.json");

fs.readFile(filePath, async function (err, data) {
  if (err) {
    return console.log("Unable to scan directory: " + err);
  }
  var json = JSON.parse(data);
  let batch = firestore.batch();
  let counter = 0;
  let totalCounter = 0;
  const promises = [];
  for (const thing of json) {
    counter++;
    const docRef = firestore.collection("tests").doc();
    batch.set(docRef, { ...thing, id: docRef.id });
    counter++;
    if (counter >= 500) {
      console.log(`Committing batch of ${counter}`);
      promises.push(batch.commit());
      totalCounter += counter;
      counter = 0;
      batch = firestore.batch();
    }
  }
  if (counter) {
    console.log(`Committing batch of ${counter}`);
    promises.push(batch.commit());
    totalCounter += counter;
  }
  await Promise.all(promises);
  console.log(`Committed total of ${totalCounter}`);
});
