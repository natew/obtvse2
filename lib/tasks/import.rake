namespace :import do
  desc "Import posts from a Jekyll blog"
  task :jekyll => :environment do
    import_path = ENV['JEKYLL_POSTS_PATH']
    if not import_path
      puts 'Set JEKYLL_POSTS_PATH to point at your old posts.'
      puts 'Exiting...'
      return
    end
    Dir.chdir(import_path)
    filenames = Dir.entries(import_path)
    filenames.each do |filename|
      next if filename.split('.')[-1] != 'md'
      File.open(filename, 'r') do |old_post|
        puts "Importing `#{filename}`"
        _, front_matter, content = old_post.read.split('---')
        front_matter = YAML.load(front_matter)
        p = Post.new
        p.title = front_matter['title']
        p.content = content
        p.slug = filename.split('-')[3..-1].join('-')
        if front_matter['date']
          p.published_at = DateTime.parse(front_matter['date'])
        else
          p.published_at = filename.split('-')[0..2].join('-')
        end
        p.draft = 'false'
        p.save
      end
    end
    puts 'Done!'
  end
end
