# note: onto spec files, require_relative 'spec_helper'
# spec_helper.rb template <-- inside of the spec folder

require 'simplecov' <--make sure to list 'coverage' in the .gitignore
SimpleCov.start

require 'time'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'awesome_print'
require 'minitest/pride'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/cupcake'
require_relative '../lib/cake'
require_relative '../lib/donut'

***************************************************************
# Rakefile template

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib"]
  t.warning = true
  t.test_files = FileList['specs/*_spec.rb']
end

task default: :test
***************************************************************
# Guardfile template (make sure folder names match 'spec' vs 'specs')

guard :minitest, bundler: false, rubygems: false do
    # with Minitest::Spec
    watch(%r{^spec/(.*)_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
  end

***************************************************************
FILE STRUCTURE
(* = directory and $ = file)

* bakery directory
  * .git
  * .github
  * lib directory
      $ cupcake.rb <-- for class Cupcake
      $ cake.rb <-- for class Cake
      $ donut.rb <-- for class Donut
  * specs directory
      $ spec_helper.rb <-- see above template
      $ cupcake_spec.rb <-- tests for class Cupcake
      $ cake_spec.rb <-- tests for class Cake
      $ donut_spec.rb <-- tests for class Donut
  * support directory
      $ cupcake.csv <-- data related to class Cupcake
      $ cake.csv <-- data related to class Cake
      $ donut.csv <-- data related to class Donut
  $ .gitignore <-- list of files/folders that are to be ignored by git, include the 'coverage' folder
  $ Rakefile <-- run the 'rake' command in the terminal (in the correct project directory) and this file will run all the tests listed in ALL of the spec files in random order
  $Guardfile <-- will run all the tests/specs/files listed on the Guardfile continually (once the command $guard is executed, guard will run continually. Leave one terminal tab open to run guard and open a second terminal tab to run $rake)
