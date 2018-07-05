class DoutusController < ApplicationController
  require 'net/http'
  def index
    uri = URI("https://www.doutula.com/api/search")
    query_params = {keyword: params[:key], mime: 0, page: params[:page] || 1}
    uri.query = URI.encode_www_form(query_params)
    res = Net::HTTP.get(uri)
    @images = JSON.parse(res)
    if @images["status"] == 0
      @images = {}
    elsif @images["status"] == 1
      @images = @images["data"]["list"]
    else
      @images = {}
    end
  end
end