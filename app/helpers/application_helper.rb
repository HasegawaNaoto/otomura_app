module ApplicationHelper
  def japanese_time(time)
time.strftime("%Y-%m-%d %H:%M")
end

def japanese_date(time)
time.strftime("%Y年%m月%d日")
end

def posts_time(time)
time.strftime("%Y年%m月%d日")
end

def date_format(datetime)
    time_ago_in_words(datetime) + '前'
end

end
