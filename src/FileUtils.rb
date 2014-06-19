module FileUtils
  def self.concat_all_java_files(path, file_to_cat_in)
    open("#{path}/#{file_to_cat_in}", "w") do |big_file|
      Find.find(path) do |file|
        is_java_file = file.end_with?(".java") && (!File.basename(file).eql? "All.java")
        big_file << File.read(file) if is_java_file
      end
    end
  end
end