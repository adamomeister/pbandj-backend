class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    auth_headers = request.headers['Authorization']
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def monthly_total(input_object_array)
    i = 0
    jan_tot = 0
    feb_tot = 0
    mar_tot = 0
    apr_tot = 0
    may_tot = 0
    jun_tot = 0
    jul_tot = 0
    aug_tot = 0
    sep_tot = 0
    oct_tot = 0
    nov_tot = 0
    dec_tot = 0
    input_object_array.length.times do
      jan_tot += input_object_array[i].january
      feb_tot += input_object_array[i].february
      mar_tot += input_object_array[i].march
      apr_tot += input_object_array[i].april
      may_tot += input_object_array[i].may
      jun_tot += input_object_array[i].june
      jul_tot += input_object_array[i].july
      aug_tot += input_object_array[i].august
      sep_tot += input_object_array[i].september
      oct_tot += input_object_array[i].october
      nov_tot += input_object_array[i].november
      dec_tot += input_object_array[i].december
      i += 1
    end
    [
    jan_tot,
    feb_tot,
    mar_tot,
    apr_tot,
    may_tot,
    jun_tot,
    jul_tot,
    aug_tot,
    sep_tot,
    oct_tot,
    nov_tot,
    dec_tot
  ]
  end
end
