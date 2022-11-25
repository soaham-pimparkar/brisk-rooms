const functions = require("firebase-functions");
admin.initializeApp();
const database = admin.firestore();
// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.deleteDataObject = functions.pubsub.schedule('1 3 * * *').onRun(async(context) => {
    await database.collection('Collection_name_here').listDocuments().then(val => {
        val.map((val) => {
            batch.delete(val)
        })
    })
    console.log("collection deleted");
    return null;
  });