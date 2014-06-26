require 'sqlite3'
require 'C:\RailsInstaller\Ruby2.0.0\lib\ruby\gems\2.0.0\gems\jaccard.rb'
class WelcomeController < ApplicationController
  def index
	@descripcion=params[:descripcion]
	@marca=params[:marca]
	if @marca && @descripcion
  		begin
  			db=SQLite3::Database.open 'inteligencia.db'
  			db.execute "CREATE TABLE  IF NOT EXISTS  tabla(id integer  primary key AUTOINCREMENT, marca text,descripcion text)"
  			db.execute "INSERT INTO tabla(marca,descripcion) values('"+@marca+"','"+@descripcion+"')"
  			rescue SQLite3:: Exception => e 
  				@ex=e
  			ensure 
  				db.close if db

  		end
  		db.close if db

  		begin
  			db=SQLite3::Database.open 'inteligencia.db'
  			db.results_as_hash= true
  			ary=db.execute "SELECT * FROM tabla"
  			@id=Array.new
  			@m=Array.new
  			@d=Array.new
  			@cont=0;
  			ary.each do |row| 
  				@id[row['id']]=row['id']
  				@m[row['id']]=row['marca']
  				@d[row['id']]=row['descripcion']
  				@cont+=1;
  			end
  			rescue SQLite3:: Exception => e 
  				@ex="no se consultar"
  			ensure
  				db.close if db
  		end
  		db.close if db
  		@coeficientes=Array.new
  		@id.each do |i|
  				if i!=nil
  				@coeficientes[i]=Jaccard.coefficient(@descripcion.split("|"),@d[i].split("|"))
  				end
  		end
  		i=1
  		while i<(@cont)
  			j=1
  			while j<(@cont)
  				if @coeficientes[j+1]>@coeficientes[j]
  					aux_id=@id[j]
  					@id[j]=@id[j+1]
  					@id[j+1]=aux_id
  					aux_m=@m[j]
  					@m[j]=@m[j+1]
  					@m[j+1]=aux_m
  					aux_d=@d[j]
  					@d[j]=@d[j+1]
  					@d[j+1]=aux_d
  					aux_c=@coeficientes[j]
  					@coeficientes[j]=@coeficientes[j+1]
  					@coeficientes[j+1]=aux_c
  				end
  				j+=1
  			end
  			i+=1
  		end


 	end
 
  end



end
