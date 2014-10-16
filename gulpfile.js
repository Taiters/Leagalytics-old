var gulp = require('gulp'),
	coffee = require('gulp-coffee'),
	uglify = require('gulp-uglify'),
	minify = require('gulp-minify-css'),
	sass   = require('gulp-sass'),
	gulpif = require('gulp-if'),
	_      = require('underscore');


var paths = {

	app: {
		js: 'client/src/js/**/*',
		css: 'client/src/css/**/*'
	},
	lib: {
		js: [
			'client/bower_libs/**/*.js',
			'client/libs/**/*.js'
		],
		css: [
			'client/bower_libs/**/*.css',
			'client/libs/**/*.css',
		],
		assets: [
			'client/bower_libs/**/!(*.js|*.css)',
			'client/libs/**/!(*.js|*.css)'
		]
	},
	dist: {
		js: 'public/js',
		css: 'public/css',
		lib: 'public/lib'
	}
};

function processCSS( src, dest ) {

	return gulp.src( src )
		.pipe( gulpif( /\.scss$/, sass() ) )
		.pipe( minify() )
		.pipe( gulp.dest( dest ) );
}

function processJS( src, dest ) {

	return gulp.src( src )
		.pipe( gulpif( /\.coffee$/, coffee() ) )
		.pipe( uglify() )
		.pipe( gulp.dest( dest ) );
}

gulp.task('build-js', function() {

	processJS( paths.app.js, paths.dist.js );

});

gulp.task('build-css', function() {

	processCSS( paths.app.css, paths.dist.css);

});

gulp.task('build-lib-js', function() {

	processJS( paths.lib.js, paths.dist.lib );

});

gulp.task('build-lib-css', function() {

	processCSS( paths.lib.css, paths.dist.lib );

});

gulp.task('build-lib-assets', function() {

	gulp.src( paths.lib.assets )
		.pipe( gulp.dest( paths.dist.lib ) );
})

gulp.task('build-libs', ['build-lib-css', 'build-lib-js', 'build-lib-assets']);
gulp.task('build-app', ['build-js', 'build-css']);
gulp.task('default', ['build-app', 'build-libs']);
