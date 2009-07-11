class ReportesController < ApplicationController
 
  before_filter :login_required # Asegurate que estemos logados
  
  # GET /reportes
  # GET /reportes.xml
  def index

    if params[:texto_caja] != nil then
       condiciones =  ['texto LIKE :criterio OR ticket LIKE :criterio OR fecha LIKE :criterio OR user_s LIKE :criterio or turno_s LIKE :criterio OR tipo_s LIKE :criterio' ,
   				{:criterio=>"%#{params[:texto_caja]}%"}]
    else
       condiciones = params[:search]
    end

    @reportes = Reporte.paginate :all, :order=>'created_at DESC',
                  :page=>params[:page], :per_page=>30,
                  :conditions => condiciones   

  end
  
  # GET /reportes/1
  # GET /reportes/1.xml
  def show
    @reporte = Reporte.find(params[:id])
  end
  
  # GET /reportes/new
  # GET /reportes/new.xml
  def new
    @reporte = Reporte.new
  end

  # GET /reportes/1/edit
  def edit
    @reporte = Reporte.find(params[:id])
  end

 def crear
   Time.zone='Madrid'
   if request.get?
     respond_to do |formato|   # aunque parezca vacio lo que hace es pintar la view crear.html.erb
       formato.html
       formato.js {}
     end
   else
  	for i in 1..10 do
  	  if params['texto'+i.to_s] != ""
          @reporte = Reporte.new
     	  @reporte.texto = params['Texto'+i.to_s]
     	  @reporte.user_s = current_user.login
     	  @reporte.user_id = current_user.id
     	  @reporte.tipo_id = params['Tipo'+i.to_s]
     	  @reporte.tipo_s = Tipo.find_by_id(params['Tipo' + i.to_s]).nombre
     	  @reporte.turno_id = session[:turno]
     	  @reporte.turno_s = Turno.find_by_id(session[:turno]).nombre
     	  @reporte.ticket = params['Ticket'+i.to_s]
          @reporte.warning= params['Warning'+i.to_s]
          if Time.now.in_time_zone.hour >= 7 then
            @reporte.fecha = Time.now.in_time_zone.strftime("%d-%m-%Y")
          else
            @reporte.fecha = (Time.now.in_time_zone - 1.day).strftime("%d-%m-%Y")
          end
          @reporte.created_at = Time.now.in_time_zone
          @reporte.updated_at= Time.now.in_time_zone
#          if Time.now.in_time_zone.hour < 7 then
#            #@reporte.fecha = @reporte.fecha - 1.day
#            #@reporte.created_at = Time.now.in_time_zone - 1.day
#          end

        if @reporte.save
    	  logger.info 'Reporte creados con éxito'
        else
          logger.info "### ESTO NO GRABA ###"
        end
       end
    end
     redirect_to(reportes_url)
   end
 end
 

  # PUT /reportes/1
  # PUT /reportes/1.xml
  def update
    @reporte = Reporte.find(params[:id])
    
    params[:reporte][:user_id] = User.find_by_login(params[:reporte][:user_s]).id
    params[:reporte][:tipo_id] = Tipo.find_by_nombre(params[:reporte][:tipo_s]).id
    params[:reporte][:turno_id]= Turno.find_by_nombre(params[:reporte][:turno_s]).id

    respond_to do |format|
    	format.html {
      		if @reporte.update_attributes(params[:reporte])
        		flash[:notice] = 'Reporte actualizado.'
      		else
        		render :action => "edit"
      		end
  		}
    end
    redirect_to(reportes_url)
  end

  # DELETE /reportes/1
  # DELETE /reportes/1.xml
  def destroy
    @reporte = Reporte.find(params[:id])
    @reporte.destroy
    redirect_to(reportes_url)
  end  
end
