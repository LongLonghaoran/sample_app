module ApplicationHelper
  def full_title(page_title)
    base_title = 'Ruby on Rails Tutorial Sample App'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end 
  end

  def sign_user_by_dd(code)
    corpid = "dinga85b0e42df1036b435c2f4657eb6378f"
    corpsecret = "MzM6-G6qkSRzijHa7FMKbc2_lwz7nlA1WXwH7KqdkCaJUPiNTczmdYNBSHjvsp20"
    req_for_access_token_url = URI.parse("https://oapi.dingtalk.com/gettoken?corpid=#{corpid}&corpsecret=#{corpsecret}")
    res = Net::HTTP.get(req_for_access_token_url)
    access_token = JSON.parse(res)["access_token"]
    req_for_user_info_url = URI.parse("https://oapi.dingtalk.com/user/getuserinfo?access_token=#{access_token}&code=#{code}")
    res = Net::HTTP.get(req_for_user_info_url)
    res = JSON.parse(res)
  end
end
