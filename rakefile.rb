task :build do
	
		sh  "go get"
		sh  "go build"
end

namespace :run do

	task :dev do
		ENV['PORT']="8080"
		ENV['MONGOURI']="127.0.0.1:27017"
		ENV['DBNAME']="simplyactivedb"
		ENV['CNAME']="meals"
		sh  "go get"
		sh  "go build"
		sh  "./simplyactiveapi"
	end

	task :prod do
		ENV['PORT']="80801"
		ENV['MONGOURI']="mongodb://admin:admin@ds029793.mongolab.com:29793/simplyactivedb"
		ENV['DBNAME']="heroku_app3214dfghj6914"
		ENV['CNAME']="meals"
		sh  "go get"
		sh  "go build"
		sh  "./simplyactiveapi"
	end
end

namespace :mongo do

	task :export_local do
		sh "mongoexport --host 127.0.0.1:27017 -db simplyactivedb -c meals --jsonArray -o mongoexports/localData_new.json"
	end

	task :import_local do
		sh "mongoimport --host 127.0.0.1:27017 -db simplyactivedb -c meals --file mongoexports/localData_new.json --drop --jsonArray"
	end

end
