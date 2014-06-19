module GitFetcher
  def self.get_all_git_files(file)
    contents = File.read(file)
    return contents.split("\n")
  end

  def self.build_github_links(file)
    filеs_list = self.get_all_git_files(file)
    return filеs_list.map { |link| link.gsub(/\/tree\/master\/.*/, ".git") }
  end

  def self.build_clone_command(where, repo)
    return "git clone #{repo} #{where}/#{repo.split('/')[-2]}"
  end
  
  # requires a file with a list of github repos, separated by new line
  # example usage: GitFetcher.clone_all_repos(FILE, "/tmp/proverka")
  def self.clone_all_repos(repos_file, where)
    github_links = GitFetcher.build_github_links(FILE)
    git_clone_commands = github_links.map{ |link| GitFetcher.build_clone_command(where,link) }
    git_clone_commands.each{|git_clone_command| puts `#{git_clone_command}`}
  end
end
