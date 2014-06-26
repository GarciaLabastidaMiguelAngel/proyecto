require 'classifier.rb'

class ClasificarController < ApplicationController
  def clasificar
  	@clasificar=params[:clasificar]
  	if @clasificar
  		begin
  			db=SQLite3::Database.open 'inteligencia.db'
  			db.results_as_hash= true
  			ary=db.execute "SELECT * FROM soporte"
  			@soporte=Array.new
  			cont=0
  			ary.each do |row| 
  				@soporte[cont]=row['entrenamiento']
  				cont+=1;
  			end
  			rescue SQLite3:: Exception => e 
  				@ex=e
  			ensure
  				db.close if db
  		end
  		db.close if db
  		begin
  			db=SQLite3::Database.open 'inteligencia.db'
  			db.results_as_hash= true
  			ary=db.execute "SELECT * FROM comercial"
  			@comercial=Array.new
  			cont=0
  			ary.each do |row| 
  				@comercial[cont]=row['entrenamiento']
  				cont+=1;
  			end
  			rescue SQLite3:: Exception => e 
  				@ex=e
  			ensure
  				db.close if db
  		end
  		db.close if db
  		b = Classifier::Bayes.new 'soporte','comercial'
      
  		@comercial.each {|boo| b.train_comercial boo}
  		@soporte.each {|soo|  b.train_soporte soo}
  		@categoria=b.classify @clasificar 
  	end
  end
end
