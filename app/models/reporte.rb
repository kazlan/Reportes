class Reporte < ActiveRecord::Base
	belongs_to :user	
	belongs_to :tipo
	belongs_to :turno
	validates_presence_of :texto,:user, :tipo_id,:turno_id, :on => :create, :message => "can't be blank"
	
	def self.search(search, page)
  		paginate :per_page => 10, :page => page,
          		 :conditions => ['texto like ?', "%#{search}%"]
    end
end
