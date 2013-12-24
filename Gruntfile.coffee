module.exports = (grunt) ->
  _ = grunt.util._

  grunt.initConfig
    clean: ["build", "<%= out %>/js", "<%= out %>/css", "<%= out %>/_layouts"]

    less:
      main:
        options:
          paths: ["<%= lesspath %>", "<%= bootstrap %>/less/"],
        files:
          "build/css/style.css" : "<%= lesspath %>/style.less"

    cssmin:
      main:
        files:
          "<%= out %>/css/style.min.css" : ["build/css/style.css"]

    copy:
      img:
        files: [
          { expand: true, cwd: "<%= assets %>/img/", src: ['**'], dest: "<%= out %>/img/" },
        ]
      html:
        files: [
          { expand: true, src: "<%= htmlpath %>/*", flatten: true, dest: "<%= out %>/_layouts/", isFile: yes },
        ]

    coffee:
      main:
        files:
          "build/assets/js/main.js" : "<%= assets %>/coffee/main.coffee"


    uglify:
      main:
        files:
          "<%= out %>/js/main.min.js": ["<%= bootstrap %>/js/collapse.js", "build/assets/js/main.js"]
          "<%= out %>/js/libs/respond.min.js": ["<%= components %>/respond/respond.src.js"]

    modernizr:
      "devFile" : "<%= components %>/modernizr/modernizr.js",
      "outputFile" : "<%= out %>/js/libs/modernizr.custom.min.js",
      "extra" : {
        "shiv" : true,
        "printshiv" : false,
        "load" : true,
        "mq" : false,
        "cssclasses" : true
      },

      "extensibility" : {
        "rgba" : true,
        "svg" : true,
        "csstransforms" : true,
      },

      "uglify" : true,

      "tests" : [],

      "parseFiles" : false,

      "matchCommunityTests" : false,

      "customTests" : []

    watch:
      watch:
        files: ["<%= lesspath %>/*.less", "<%= coffeepath %>/**", "<%= htmlpath %>/**"],
        tasks: ["default"],
        options:
          nospawn: true

    assets: "assets"
    components: "<%= assets %>/components"
    bootstrap: "<%= assets %>/components/bootstrap"
    lesspath: "<%= assets %>/less"
    htmlpath: "<%= assets %>/html"
    coffeepath: "<%= assets %>/coffee"
    out: "src"

  grunt.loadNpmTasks("grunt-contrib")
  grunt.loadNpmTasks("grunt-modernizr")

  grunt.registerTask("default", ["clean", "modernizr", "coffee", "uglify", "less", "cssmin", "copy"])
