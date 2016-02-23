var gulp = require('gulp');
var jade = require('gulp-jade');
var sass = require('gulp-sass');
var coffee = require('gulp-coffee');

var watch = require('gulp-watch');
var browserSync = require('browser-sync').create();

var minifyCss = require('gulp-minify-css'); //ย่อ css
var uglify = require('gulp-uglify'); //ย่อ js | mangle: เปลี่ยนแปลงตัวแปร
var concat = require('gulp-concat'); //ต่อไฟล์

var gutil = require('gulp-util');
var bower = require('bower');

var rename = require('gulp-rename');
var sh = require('shelljs');

var paths = {
    jade: './src/**/*.jade',
    scss: './src/scss/**/*.scss',
    coffee: [
        './src/coffee/app.coffee',
        './src/coffee/routing.coffee',
        './src/coffee/controllers/**/*.coffee'
    ]
};

/*================ Convert Zone ===================*/
gulp.task('do_jade', function(){
    gulp.src(paths.jade)
        .pipe(jade())
        .pipe(gulp.dest('./www'));
});

gulp.task('do_sass', function(){
    gulp.src(paths.scss)
        .pipe(sass())
        .pipe(concat('style.css'))
        .pipe(minifyCss({
            keepSpecialComments: 0
        }))
        .pipe(gulp.dest('./www/css'))
        .pipe(browserSync.stream());
});

gulp.task('do_coffee', function(){
    gulp.src(paths.coffee)
        .pipe(coffee({bare: true}))
        .pipe(concat('script.js'))
        .pipe(uglify({
            mangle: false
        }))
        .pipe(gulp.dest('./www/js'));
});


gulp.task('sass', function(done) {
  gulp.src('./scss/ionic.app.scss')
    .pipe(sass())
    .pipe(gulp.dest('./www/css/'))
    .pipe(minifyCss({
      keepSpecialComments: 0
    }))
    .pipe(rename({ extname: '.min.css' }))
    .pipe(gulp.dest('./www/css/'))
    .on('end', done);
});

/*-------------- end convert ---------------*/

/*================ WATCH Zone ===================*/
gulp.task('watchChange', function(){
    gulp.watch(paths.jade, ['do_jade']);
    gulp.watch(paths.scss, ['do_sass']);
    gulp.watch(paths.coffee, ['do_coffee']);
});

/* server Sync use Watch */
gulp.task('serve', function() {
    browserSync.init({
        server: {
            baseDir: "./www"
        }
    });

    gulp.watch(['./www/**/*.*']).on("change", browserSync.reload);
});
/*------------- End Watch --------------*/

gulp.task('default', ['do_jade', 'do_sass', 'do_coffee', 'watchChange','serve']);


/*=============== ETC ====================*/
//เรียก function ไว้ ก๊อปไฟล์เข้า App อย่างเดียว
gulp.task('duplicateJS', function(){
    gulp.src('bower_components/**/*.*')
        .pipe(gulp.dest('app/js'));
});


gulp.task('install', ['git-check'], function() {
  return bower.commands.install()
    .on('log', function(data) {
      gutil.log('bower', gutil.colors.cyan(data.id), data.message);
    });
});

gulp.task('git-check', function(done) {
  if (!sh.which('git')) {
    console.log(
      '  ' + gutil.colors.red('Git is not installed.'),
      '\n  Git, the version control system, is required to download Ionic.',
      '\n  Download git here:', gutil.colors.cyan('http://git-scm.com/downloads') + '.',
      '\n  Once git is installed, run \'' + gutil.colors.cyan('gulp install') + '\' again.'
    );
    process.exit(1);
  }
  done();
});
