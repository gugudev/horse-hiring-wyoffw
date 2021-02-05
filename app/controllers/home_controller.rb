class HomeController < ApplicationController

  def encode
    #because a second dot goes to format url. ex: http://google.com.br #params[:format] -> br
    full_url = params[:url] + (params[:format] || '')

    key = ShortUrl.encode(full_url)

    render json: helpers.full_url_with_key(key)
  end

  def decode
    key = params[:key] || helpers.extract_key_from_url(params[:url])

    registry = MemoryBuffer.find_by_key(key)

    render json: (registry ? registry[:url] : 'Key not found')
  end

end
