gulp    = require 'gulp'
less    = require 'gulp-less'
jade    = require 'gulp-jade'
coffee  = require 'gulp-coffee'

# default task
gulp.task 'default', [ 'build', 'watch' ]

# less
gulp.task 'less', ()->
  gulp
    .src('src/less/main.less')
    .pipe less()
    .pipe gulp.dest('build/css')

# coffee
gulp.task 'coffee', ()->
  gulp
    .src('src/coffee/*.coffee')
    .pipe coffee()
    .pipe gulp.dest('build/js')

# jade
gulp.task 'jade', ()->
  gulp
    .src('src/jade/*.jade')
    .pipe jade()
    .pipe gulp.dest('build/')

# build task
gulp.task 'build', [ 'less', 'coffee', 'jade' ]

# watch
gulp.task 'watch', ()->
  gulp.watch 'src/jade/**/*.jade', [ 'jade' ]
  gulp.watch 'src/less/**/*.less', [ 'less' ]
  gulp.watch 'src/coffee/**/*.coffee', [ 'coffee' ]
