class Correo < ActionMailer::Base
  
	def lost_pass(name, email)
    @recipients   = "jorge.mollon@gmail.com"
#    @from         = params[:name][:email]
    headers         "Reply-to" => "#{email}"
    @subject      = "Recordatorio de contraseña Reportes Servei Continu"
    @sent_on      = Time.now
    @content_type = "text/html"
 
    body[:name]  = name
    body[:email] = email       
  end


end
