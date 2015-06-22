#! /usr/bin/node

var execFile = require('child_process').execFile;
var drive = process.argv[2] || '/dev/sdb1';
var path = '/mnt/sed';
var args = [
  'mount',
  '-o', 'dmask=027,fmask=137,gid=33,uid=1000',
  drive,
  path
];

execFile('sudo', args, function(error, stdout, stderr) {
  if (error) {
    console.error(error);
    return;
  }

  console.log('SED has been mounted at', path);
});
