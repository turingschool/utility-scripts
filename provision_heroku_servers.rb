require './1407/06_the_pivot/submissions'

class Provisioner
  def setup
    Dir.mkdir(temp_dir)
    Dir.chdir(temp_dir)
  end

  def temp_dir
    "#{config[:abbreviation]}_temp"
  end

  def clone_repository(repo, name)
    `git clone #{repo} #{name}`
  end

  def create_app(name)
    `heroku create #{config[:abbreviation]}-#{name}`
  end

  def setup_database
    db_message = `heroku addons:add heroku-postgresql:basic`
    db_name = db_message.scan(/Attached as (\S*)$/).first.first
    `heroku pg:promote #{db_name}`
  end

  def deploy
    `git push heroku master`
    `heroku run rake db:migrate`
  end

  def start_processes
    `heroku ps:scale web=1 worker=1`
  end

  def add_addons
    `heroku addons:add redistogo`
    `heroku addons:add newrelic:stark`
  end

  def add_collaborator(account)
    `heroku sharing:add #{account}`
  end

  def teardown
    `rm -rf #{temp_dir}`
  end

  def within_project_directory(name, &block)
    Dir.chdir(name.to_s)
    block.call
    Dir.chdir('..')
  end

  def run
    setup

    project.each do |identifier, details|
      clone_repository(details[:repo_url], details[:app_name])

      within_project_directory(details[:app_name]) do
        create_app(details[:app_name])
        setup_database
        add_addons
        deploy
        start_processes
        details[:collaborators].each{|account| add_collaborator(account)}
      end
    end

    teardown
  end
end
