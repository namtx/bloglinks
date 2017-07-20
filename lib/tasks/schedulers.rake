require "rss"
require "open-uri"

desc "This task is called by the Heroku scheduler add-on"
task parse: :environment do
  # puts "parsing from viblo.asia..."
  blogs = [
    {name: "viblo.asia", url: "https://viblo.asia/rss"},
    {name: "huydx.com", url: "http://huydx.com/rss"}
  ]
  blogs.each do |blog|
    provider = Provider.find_or_create_by url: blog[:url], name: blog[:name]
    rss = RSS::Parser.parse(open(viblo_asia.url).read, false)
    if (provider.last_build == nil || viblo_asia.last_build < rss.channel.lastBuildDate)
    rss.items.each do |r|
      Link.find_or_create_by provider: provider, title: r.title, url: r.link,
        published_at: r.pubDate
    end

  end
  # viblo_asia = Provider.find_or_create_by url: "https://viblo.asia/rss",
  #   name: "viblo.asia"
  # rss = RSS::Parser.parse(open(viblo_asia.url).read, false)
  # if viblo_asia.last_build == nil ||viblo_asia.last_build < rss.channel.lastBuildDate
  #   rss.items.each do |r|
  #     Link.find_or_create_by provider: viblo_asia, title: r.title, url: r.link,
  #       published_at: r.pubDate
  #   end
  #   viblo_asia.update_attributes last_build: rss.channel.lastBuildDate
  # end
  # puts "done"

  #=============================================================================
  puts "parsing from viblo.asia..."
  huydx = Provider.find_or_create_by url: "http://huydx.com/rss",
    name: "huydx"
  rss = RSS::Parser.parse(open(huydx.url).read, false)
  puts "done"
end

desc "This task to reset database"
task reset: :environment do
  Link.destroy_all
  Provider.destroy_all
end
