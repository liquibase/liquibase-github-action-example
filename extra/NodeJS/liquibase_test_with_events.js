// Great when using the Observer Pattern with the EventEmitter class from the 'events' module.

const liquibase = require("./index");

const config = {
  url: "jdbc:h2:mem:liquibase_test",
  contexts: 'TEST',
  labels: 'staging,Jira-1200',
  logLevel: 'info',
  // overwriteOutputFile: 'true',
  // logFile: 'test.log'
};

const rollback_last_change = function () {
    liquibase(config)
      .run('rollbackCount 1', '')
      .then(() => {
        console.log('rollback ran successfully')
        eventEmitter.emit('liquibase_event_status')
      })
      .catch((err) => console.error('fail', err));
}

const check_pending_changes = function () {
    liquibase(config)
      .run('status', '--verbose')
      .then(() => console.log('status ran successfully'))
      .catch((err) => console.error('fail', err));
}

const validate_SQL = function () {
    liquibase(config)
      .run('updateSQL')
      .then(() => console.log('updateSQL ran successfully'))
      .catch((err) => console.error('fail', err));
}

const update_database_and_rollback = function () {
    liquibase(config)
      .run('update')
      .then(() => {
        console.log('Update was successful - running a rollback...')
        eventEmitter.emit('liquibase_event_rollback')
      })
      .catch((err) => console.error('fail', err));
}

const update_database = function () {
  liquibase(config)
    .run('update')
    .then(() => {
      console.log('Update was successful')
    })
    .catch((err) => console.error('fail', err));
}

////**************** Using events ****************************************** *////
var events = require('events');
var eventEmitter = new events.EventEmitter();

//// Subscribe the following events with the following listener functions
// eventEmitter.on('liquibase_event_update', check_pending_changes);
eventEmitter.on('liquibase_event_update_rollback', update_database_and_rollback);
eventEmitter.on('liquibase_event_update_rollback', validate_SQL);
eventEmitter.on('liquibase_event_update', validate_SQL);
eventEmitter.on('liquibase_event_update', update_database);
eventEmitter.on('liquibase_event_rollback', rollback_last_change);
eventEmitter.on('liquibase_event_status', check_pending_changes);

// var eventListeners = require('events').EventEmitter.listenerCount
// (eventEmitter,'liquibase_event_update');
// console.log(eventListeners + " Listner(s) listening to 'liquibase_event_update' event");

//Fire the events:
eventEmitter.emit('liquibase_event_update_rollback')
// eventEmitter.emit('liquibase_event_update')
// eventEmitter.emit('liquibase_event_rollback')
