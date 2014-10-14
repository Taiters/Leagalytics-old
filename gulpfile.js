var gulp = require('gulp'),
	coffee = require('gulp-coffee')



gulp.task('make-coffee', function() {

	gulp.src('public/js/src/**/*.coffee')
		.pipe( coffee() )
		.pipe( gulp.dest( 'public/js/dist/' ) );

});