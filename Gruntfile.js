module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    concat: {
      js: {
        files: [{
          src: ['javascripts/*.js', '!javascripts/*.min.js', '!javascripts/main.js'],
          dest: 'javascripts/main.js'
        }]
      }
    },
    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: ['main.js'],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },
    cssmin: {
      minify: {
        expand: true,
        cwd: 'stylesheets/',
        src: ['*.css', '!*.min.css'],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },
    watch: {
      concat: {
        files: ['javascripts/*.js', '!javascripts/*.min.js', '!javascripts/main.js'],
        tasks: ['concat', 'uglify'],
        options: {
          spawn: false
        }
      },
      cssmin: {
        files: ['stylesheets/*.css', '!stylesheets/*.min.css'],
        tasks: ['cssmin'],
        options: {
          spawn: false
        }
      },
      uglify: {
        files: ['javascripts/main.js'],
        tasks: ['uglify'],
        options: {
          spawn: false
        }
      },
      sass: {
        files: ['stylesheets/**/*.scss'],
        tasks: ['sass'],
        options: {
          spawn: false
        }
      }
    },
    sass: {
      options: {
        style: 'nested'
      },
      build: {
        files: [{
          expand: true,
          cwd: 'stylesheets/sass/',
          src: 'main.scss',
          dest: 'stylesheets/',
          ext: '.css'
        }, {
          expand: true,
          cwd: 'stylesheets/sass/',
          src: 'ie8.scss',
          dest: 'stylesheets/',
          ext: '.css'
        }]
      }
    }
  });
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-concat');

  grunt.registerTask('default', ['sass', 'cssmin', 'concat', 'uglify']);

};
