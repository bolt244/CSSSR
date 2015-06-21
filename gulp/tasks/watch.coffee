gulp        = require 'gulp'
runSequence = require 'run-sequence'
reload      = require('browser-sync').reload

gulp.task 'watch', ->
	global.watch = true
	gulp.watch 'app/images/sprite/**/*.png', ['spritesmith', reload]

	gulp.watch 'app/styles/**/*.styl', ['stylus', -> reload('assets/styles/common.css')]

	gulp.watch 'app/templates/**/*.jade', -> runSequence 'jade', reload

	gulp.watch 'app/resources/**/*', ['copy:resources', reload]

	gulp.watch 'app/scripts/**/*.{js,coffee}', [
			'jscs'
			'jshint'
			'scripts'
			reload
		]

	gulp.watch 'app/images/svg/**/*.svg', ['svg', reload]

	gulp.watch [
			'app/images/**/*.{png,jpg,gif}'
			'!app/images/sprite/**/*'
			'!app/images/sprite.png'
		], 
			['copy:images', reload]
