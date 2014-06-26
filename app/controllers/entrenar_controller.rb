class EntrenarController < ApplicationController
  def entrenar
  	@soporte=params[:soporte]
  	@comercial=params[:comercial]
  	if @soporte && @comercial
  		begin
  			db=SQLite3::Database.open 'inteligencia.db'
  			db.execute "CREATE TABLE  IF NOT EXISTS  soporte(id integer  primary key AUTOINCREMENT,entrenamiento text)"
  			db.execute "CREATE TABLE  IF NOT EXISTS  comercial(id integer  primary key AUTOINCREMENT,entrenamiento text)"
  			db.execute "INSERT INTO soporte(entrenamiento) values('"+@soporte+"')"
  			db.execute "INSERT INTO comercial(entrenamiento) values('"+@comercial+"')"
  			rescue SQLite3:: Exception => e 
  				@ex=e
  			ensure 
  				db.close if db

  		end
  		db.close if db
  		@exito='El entrenamiento fue agregado correctamente'
  	
  	end
  end
end
