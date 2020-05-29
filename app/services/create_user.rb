class CreateUser
  def initialize params
    @params = params
  end

  def create_user
    email_hash = Digest::MD5.hexdigest(@params[:email])
    User.create(@params.merge(email_hash: email_hash))
  end
end
