module ReportesHelper
	def lista (id)		
  	 @crit = Reporte.find(:all, :conditions => {:id => id})
  	end	
  
end
