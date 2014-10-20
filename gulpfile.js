var gulp = require('gulp'),
	coffee       = require('gulp-coffee'),
	uglify       = require('gulp-uglify'),
	minify       = require('gulp-minify-css'),
	sass         = require('gulp-sass'),
	gulpif       = require('gulp-if'),
	handlebars   = require('gulp-handlebars'),
	defineModule = require('gulp-define-module'),
	_            = require('underscore');


var paths = {

	app: {
		js: 'client/src/js/**/*',
		css: 'client/src/css/**/*',
		templates: 'client/src/templates/**/*.hbs'
	},
	lib: {
		js: [
			'client/bower_libs/**/*.js',
			'client/lib/**/*.js'
		],
		css: [
			'client/bower_libs/**/*.css',
			'client/lib/**/*.css',
		],
		assets: [
			'client/bower_libs/**/!(*.js|*.css)',
			'client/lib/**/!(*.js|*.css)'
		]
	},
	dist: {
		js: 'public/app/js',
		css: 'public/app/css',
		lib: 'public/lib',
		templates: 'public/app/templates'
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

gulp.task('build-templates', function() {

	gulp.src( paths.app.templates )
		.pipe( handlebars() )
		.pipe( defineModule('amd') )
		.pipe( gulp.dest( paths.dist.templates ) );

});

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

gulp.task('watch', function() {

	gulp.watch( paths.app.templates, ['build-templates'] );
	gulp.watch( paths.app.js, ['build-js'] );
	gulp.watch( paths.app.css, ['build-css'] );
	gulp.watch( paths.lib.js, ['build-lib-js'] );
	gulp.watch( paths.lib.css, ['build-lib-css'] );
	gulp.watch( paths.lib.assets, ['build-lib-assets'] );

});

gulp.task('build-libs', ['build-lib-css', 'build-lib-js', 'build-lib-assets']);
gulp.task('build-app', ['build-js', 'build-css', 'build-templates']);
gulp.task('default', ['build-app', 'build-libs']);


