module ApiHelpers
  def json
    JSON.parse(response.body)
  end

  def authorization
    response.headers['Authorization']
  end

  def login_with_api(user)
    post '/login', params: {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end
end