#!/usr/bin/env node
"use strict";

const childProcess = require('child_process');

const path = require('path');

class Liquibase {

  constructor(params = {}) {
    const defaultParams = {
      liquibase: './liquibase/liquibase',
      changeLogFile: './H2_project/changeLog.h2.sql',
      username: 'admin',
      password: 'password',
      // liquibaseProLicenseKey: '<paste liquibase-pro-license-key here>'
    };
    this.params = Object.assign({}, defaultParams, params);
  }

  run(action = 'update', params = '') {
    return this._exec(`${this._command} ${action} ${params}`);
  }

  get _command() {
    let cmd = `${this.params.liquibase}`;
    Object.keys(this.params).forEach(key => {
      if (key === 'liquibase') {
        return;
      }

      const value = this.params[key];
      cmd = `${cmd} --${key}=${value}`;
    });
    return cmd;
  }

  _exec(command, options = {}) {
    console.warn(command);
    let child;
    let promise = new Promise((resolve, reject) => {
      child = childProcess.exec(command, options, (error, stdout, stderr) => {
        console.log('\n', stdout);
        console.error('\n', stderr);

        if (error) {
          error.stderr = stderr;
          return reject(error);
        }

        resolve({
          stdout: stdout
        });
      });
    });
    promise.child = child;
    return promise;
  }

}

function LiquibaseGenerator(params) {
  return new Liquibase(params);
}

module.exports = LiquibaseGenerator;
