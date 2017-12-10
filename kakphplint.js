var exec = require('child_process').exec;

var filename = process.argv[2];

exec('php -l ' + filename, function(error, stdout, stderr){
	var error_line = '',
		message = '',
		line = 0;

	if (stdout.indexOf('syntax error') > -1){
		error_line = stdout.split('syntax error, ')[1];
		error_line = error_line.split(' in ');
		message = error_line[0];
		error_line = error_line[1];
		error_line = error_line.split('buf on ')[1];
		line = error_line.match(/[0-9]+/)[0];
		console.log('\n1 problems\n' + filename + ':' + line + ':1: Error: ' + message);
	}
});
