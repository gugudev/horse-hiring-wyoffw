module HomeHelper

  def full_url_with_key(key)
    "#{request.base_url}/#{key}"
  end

  def extract_key_from_url(url)
    params[:url].split('/').last
  end


end
