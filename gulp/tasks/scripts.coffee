gulp         = require 'gulp'
plumber      = require 'gulp-plumber'
gutil        = require 'gulp-util'
gulpif       = require 'gulp-if'
concat       = require 'gulp-concat'
coffee  	 = require 'gulp-coffee'
clean		 = require 'gulp-clean'
uglify       = require 'gulp-uglify'
errorHandler = require '../utils/errorHandler'
paths        = require '../paths'

gulp.task 'coffee-script', ->
	return gulp.src 'app/scripts/**/*.coffee'
		.pipe coffee bare: true
		.pipe concat 'common-coffee.min.js'
		.pipe gulp.dest 'app/tmp'
		.on 'error', gutil.log

gulp.task 'js', ['coffee-script'], ->
	return gulp.src [
			'components/jquery/dist/jquery.min.js'
			'components/svg4everybody/svg4everybody.min.js'
			'app/scripts/common.js'
			'app/tmp/common-coffee.min.js'
			'app/scripts/debug.js'
		]
		.pipe concat 'common.min.js'
		.pipe gulpif !gutil.env.debug, uglify()
		.pipe gulp.dest paths.scripts

gulp.task 'clean', ['js'], ->
	gulp.src 'app/tmp'
		.pipe clean force: true		

gulp.task 'scripts', ['clean']