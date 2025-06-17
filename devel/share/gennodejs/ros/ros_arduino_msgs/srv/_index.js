
"use strict";

let AnalogWrite = require('./AnalogWrite.js')
let AnalogRead = require('./AnalogRead.js')
let DigitalWrite = require('./DigitalWrite.js')
let ServoWrite = require('./ServoWrite.js')
let ServoRead = require('./ServoRead.js')
let DigitalSetDirection = require('./DigitalSetDirection.js')
let DigitalRead = require('./DigitalRead.js')

module.exports = {
  AnalogWrite: AnalogWrite,
  AnalogRead: AnalogRead,
  DigitalWrite: DigitalWrite,
  ServoWrite: ServoWrite,
  ServoRead: ServoRead,
  DigitalSetDirection: DigitalSetDirection,
  DigitalRead: DigitalRead,
};
