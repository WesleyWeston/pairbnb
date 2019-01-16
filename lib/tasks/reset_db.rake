 desc "Drops the database, creates the new database, migrates the database and seeds from the seed file"
 task :i_fucked_up do 
 Rake::Task["db:drop"].invoke
 Rake::Task["db:create"].invoke
 Rake::Task["db:migrate"].invoke
 Rake::Task["db:seed"].invoke
end
 	
# by wes