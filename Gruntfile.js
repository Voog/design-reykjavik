module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: ['*.js', '!*.min.js'],
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
      css: {
        files: ['stylesheets/*.css', '!stylesheets/*.min.css'],
        tasks: ['cssmin'],
        options: {
          spawn: false
        }
      },
      js: {
        files: ['javascripts/*.js', '!javascripts/*.min.js'],
        tasks: ['uglify'],
        options: {
          spawn: false
        }
      },
      scss: {
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

  grunt.registerTask('default', ['sass', 'uglify', 'cssmin']);

};
