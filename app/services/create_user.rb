class CreateUser
  def initialize params
    @params = params
  end

  def create_user
    email_hash = Digest::MD5.hexdigest(@params[:email])
    gravatar_url = "https://secure.gravatar.com/avatar/#{email_hash}.png"
    User.create(@params.merge(email_hash: email_hash, gravatar_url: gravatar_url))
  end
end
