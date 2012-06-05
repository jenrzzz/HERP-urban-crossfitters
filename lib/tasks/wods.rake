namespace :wods do
  desc 'Fetch the latest WOD from the CrossFit website.'
  task :fetch_latest => :environment do
    # Grab the feed
    feed = Feedzirra::Feed.fetch_and_parse 'http://feeds.feedburner.com/crossfit/eRTq'
    coder = HTMLEntities.new

    # And unescape the HTML in the summary of the latest entry
    latest = feed.entries.first
    desc = Nokogiri::HTML coder.decode(latest.summary)

    # Include everything up to the first img tag
    # (they always seem to follow this pattern)
    wod_info_nodes = []
    desc.at('body').children.each do |n|
      next if not n.matches? 'p'
      break if n.children.at 'img'
      wod_info_nodes << n.inner_text
    end

    # Insert a new record into daily_wods
    wod = DailyWod.new
    wod.title = latest.title
    wod.link = latest.url
    wod.description = wod_info_nodes.join "\n"
    wod.date = latest.published.to_date
    wod.save
  end

  desc "Print today's WOD to console."
  task :print_latest => :environment do
    wod = DailyWod.find_by_date Time.now.to_date
    puts "Title: #{wod.title}"
    puts "Date: #{wod.date}"
    puts "Desc: #{wod.description}"
  end
end
