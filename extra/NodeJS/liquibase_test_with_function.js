const liquibase = require("./index");

const config = {
  url: "jdbc:h2:mem:liquibase_test",
  contexts: 'TEST',
  labels: 'staging,Jira-1200',
  logLevel: 'info',
  // overwriteOutputFile: 'true',
  // logFile: 'test.log'
};


function check_pending_changes () {
  liquibase(config)
    .run('status', '--verbose')
    .then(() => {
      console.log('updateSQL ran successfully')
    })
    .catch((err) => console.error('fail', err));
}


function review_SQL () {
  liquibase(config)
    .run('updateSQL', '')
    .then(() => {
      console.log('updateSQL ran successfully')
    })
    .catch((err) => console.error('fail', err));
}

function update_database () {
  liquibase(config)
    .run('update', '')
    .then(() => {
      console.log('update ran successfully')

    })
    .catch((err) => console.error('fail', err));
}

function rollback_last_change() {
  liquibase(config)
    .run('rollbackCount 1', '')
    .then(() => {
      console.log('rollback ran successfully')

    })
    .catch((err) => console.error('fail', err));
}

// multi functions

function update_database_and_rollback () {
  liquibase(config)
  .run('update', '')
  .then(() => {
    console.log('update ran successfully')
    rollback_last_change()
  })
  .catch((err) => console.error('fail', err));
}

function update_database_and_rollback () {
  liquibase(config)
  .run('update', '')
  .then(() => {
    console.log('update ran successfully')
    rollback_last_change()
  })
  .catch((err) => console.error('fail', err));
}

function review_SQL_and_update () {
  liquibase(config)
  .run('update', '')
  .then(() => {
    console.log('update ran successfully')
    rollback_last_change()
  })
  .catch((err) => console.error('fail', err));
}


module.exports.update_database_and_rollback = function () {
  liquibase(config)
  .run('update', '')
  .then(() => {
    console.log('update ran successfully')
    rollback_last_change()
  })
  .catch((err) => console.error('fail', err));
}
// You can run each function individually: node -e 'require("./liquibase_test_with_function.js").update_database_and_rollback()'

module.exports.review_SQL_and_update = function () {
  liquibase(config)
  .run('status', '--verbose')
  .then(() => {
    console.log('update ran successfully')
    update_database ()
  })
  .catch((err) => console.error('fail', err));
}
// You can run each function individually: node -e 'require("./liquibase_test_with_function.js").review_SQL_and_update()'
