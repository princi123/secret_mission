module ApplicationHelper


	def date_time_format(data)
    time = Time.parse(data.to_s)
    return time.strftime('%m/%d/%Y %I:%M %p')
  end

  def get_secret_code_user(secret_code)
  	secret_code.user.email if secret_code.user.present?
  end

  def get_users
  	users = User.includes(:secret_code).where( secret_codes: { :user_id => nil } )
  	users.map{ |u| [ u.email, u.id ] }
  end

  def get_secret_code
    secret_codes = SecretCode.includes(:user).where( users: { :id => nil } )
    secret_codes.map{ |u| [ u.code, u.id ] }
  end
end
