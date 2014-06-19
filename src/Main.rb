require "ExamLocator"
require "GitFetcher"
require "FileUtils"
require 'find'

FILE="remaining"
LOCATION = "/tmp/proverka"
PROJECT_NAME = "Exam 1"
PATH_SEPARATOR = "/"
BIG_FILE="All.java" #the .java is for syntax highlighting

fuzzy_compare_function = ExamLocator.naive_fuzzy_search(PROJECT_NAME)

Find.find(LOCATION) do |path|
  path_last_folder = path.split(PATH_SEPARATOR)[-1]
  matches = fuzzy_compare_function.call(path_last_folder)
  FileUtils.concat_all_java_files(path, BIG_FILE) if matches
end

