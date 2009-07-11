class TurnosController < ApplicationController
	
  before_filter :login_required # Asegurate que estemos logados

  # GET /turnos
  # GET /turnos.xml
  def index
    @turnos = Turno.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @turnos }
    end
  end

  # GET /turnos/1
  # GET /turnos/1.xml
  def show
    @turno = Turno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @turno }
    end
  end

  # GET /turnos/new
  # GET /turnos/new.xml
  def new
    @turno = Turno.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @turno }
    end
  end

  # GET /turnos/1/edit
  def edit
    @turno = Turno.find(params[:id])
  end

  # POST /turnos
  # POST /turnos.xml
  def create
    @turno = Turno.new(params[:turno])

    respond_to do |format|
      if @turno.save
        flash[:notice] = 'Turno was successfully created.'
        format.html { redirect_to(@turno) }
        format.xml  { render :xml => @turno, :status => :created, :location => @turno }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @turno.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /turnos/1
  # PUT /turnos/1.xml
  def update
    @turno = Turno.find(params[:id])

    respond_to do |format|
      if @turno.update_attributes(params[:turno])
        flash[:notice] = 'Turno was successfully updated.'
        format.html { redirect_to(@turno) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @turno.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /turnos/1
  # DELETE /turnos/1.xml
  def destroy
    @turno = Turno.find(params[:id])
    @turno.destroy

    respond_to do |format|
      format.html { redirect_to(turnos_url) }
      format.xml  { head :ok }
    end
  end
end
