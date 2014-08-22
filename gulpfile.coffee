gulp = require 'gulp'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
runSequence = require 'run-sequence'
del = require 'del'

paths =
  scripts: ['client/js/**/*.coffee']

gulp.task('clean', (cb) ->
  del ['lib'], cb
)

gulp.task('coffee', () ->
  gulp.src('./src/**/*.coffee')
    .pipe(coffee()
      .on('error', gutil.log))
    .pipe(gulp.dest('./lib/'))
)

gulp.task('watch', () ->
  gulp.watch('./src/**/*.coffee', ['coffee'])
)

gulp.task('default', ['clean', 'coffee'], () ->
  gulp.start('clean', 'coffee')
)
