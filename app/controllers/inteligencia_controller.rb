#! / Usr / bin / ruby
require 'C:\RailsInstaller\Ruby2.0.0\lib\ruby\gems\2.0.0\gems\jaccard.rb'

class InteligenciaController < ApplicationController
  def duvas
  a = Array.new
	b = Array.new
	
  	@nombre = params[:nombre_usuario]
  	@descrip = params[:deescripcion]
   
   #@duvalin = duvalin.find(1);
   #@nombre=@duvalin.nombre;


    @muestra1 = Duvalin.select("nombre", "desrip").where(:id => 2)
    #d=@muestra1.split(',')

    #@nombre = Duvalin.last
    #@descrip = Duvalin.last

   # @consulta1= Duvalin.select("descripcion").where(:id => 1)
    #@consulta2= Duvalin.select("descripcion").where(:id => 2)
     #stm = db.prepare "SELECT * FROM Duvalin WHERE id =?"
     #stm.bind_param 1, id
     #rs = stm.execute
     #fila = rs.next
     #pone row.join"\ s"
     #$. / Fetch.rb




#        c = @consulta1
 #       d = @consulta2
        

    #  a@= Duvalin.all? { |"nombre"|  }
   # b@= Duvalin.all? { |"desrip"|  }
	 # @ejemplo = Duvalin.create({nombre: @nombre, desrip: @descrip})
  	@parte1 = Duvalin.order("desrip").limit(1).offset(3)
  	@parte2 = Duvalin.order("desrip").limit(1).offset(15)

          @tconsulta1= Duvalin.find_by_id(2)
          @tconsulta2= Duvalin.find_by_id(3)


  	   a1=@parte1
       b1=@parte2


       a = @tconsulta1
       b = @tconsulta2

    #   @auxfinal = Jaccard.coefficient(a,b)
       


          #   @ejemplo = jaccard.create({nombre: @nombre, desrip: @descrip})
          #  @parte1 = jaccard.order("desrip").limit(1).offset(3)
          # @parte2 = jaccard.order("desrip").limit(1).offset(15)
         #@muestra2 = Duvalin.all


  #  @b= Duvalin.select("desrip").where(:id => 2)
   

  end
end
