libs_for_gcc = -lgnu
M="commit and push"


pullMF:
	git pull origin master && \
	cd ../mf_api && git pull origin master && \
	cd ../mf_domain && git pull origin master && \
	cd ../mf_messagebinders && git pull origin master && \
	cd ../mf_workflows && git pull origin master && \
	cd ../mf_data && git pull origin master && \
	#cd ../MF_FrontEnd && git pull origin master && \
	cd ../mf_projections && git pull origin master && \
	cd ../mf_buildFiles;
	
comMF:
	echo "MF_BuildFiles"; git com $(M); \
	cd ../mf_api && echo "mf_api" && git com $(M); \
	cd ../mf_domain && echo "mf_domain" && git com $(M); \
	cd ../mf_messagebinders && echo "mf_messagebinders" && git com $(M);  \
	cd ../mf_workflows && echo "mf_workflows" && git com $(M); \
	cd ../mf_data && echo "MF_data" && git com $(M); \
	#cd ../MF_FrontEnd && echo "MF_FrontEnd" && git com $(M); \
	cd ../mf_projections && echo "mf_projections" && git com $(M); cd ../mf_buildfiles;


pushMF:
	echo "MF_BuildFiles"; git push origin master; \
	cd ../mf_api && echo "mf_api" &&  git push origin master; \
	cd ../mf_domain && echo "mf_domain" &&  git push origin master; \
	cd ../mf_messagebinders && echo "mf_messagebinders" &&  git push origin master; \
	cd ../mf_workflows && echo "mf_workflows" && git push origin master; \
	cd ../mf_data && echo "mf_data" && git push origin master; \
	#cd ../MF_FrontEnd && echo "MF_FrontEnd" &&  git push origin master; \
	cd ../mf_projections && echo "mf_projections" && git push origin master; cd ../mf_buildfiles;

pullCore:
	echo "core_eventDispatcher" && cd ../core_eventdispatcher && git pull origin master && \
	echo "core_eventHandlerBase" && cd ../core_eventhandlerbase && git pull origin master && \
	echo "core_eventModels" && cd ../core_eventmodels && git pull origin master && \
	echo "core_eventRepository" && cd ../core_eventrepository && git pull origin master && \
	echo "core_eventStore" && cd ../core_eventstore && git pull origin master && \
	echo "core_readStoreRepository" && cd ../core_readstorerepository && git pull origin master && \
	echo "core_logger" && cd ../core_logger && git pull origin master && cd ..; 
	
comCore:
	echo "core_eventDispatcher" && cd ../core_eventdispatcher && git com $(M); \
	echo "core_eventHandlerBase" && cd ../core_eventhandlerbase && git com $(M); \
	echo "core_eventModels" && cd ../core_eventmodels && git com $(M); \
	echo "core_eventRepository" && cd ../core_eventrepository && git com $(M);  \
	echo "core_eventStore" && cd ../core_eventstore && git com $(M); \
	echo "core_readStoreRepository" && cd ../core_readstorerepository && git com $(M); \
	echo "core_logger" && cd ../core_logger && git com $(M); cd ..


pushCore:
	echo "core_eventDispatcher" && cd ../core_eventdispatcher &&  git push origin master; \
	echo "core_eventHandlerBase" && cd ../core_eventhandlerbase &&  git push origin master; \
	echo "core_eventModels" && cd ../core_eventmodels &&  git push origin master; \
	echo "core_eventRepository" && cd ../core_eventrepository &&  git push origin master; \
	echo "core_eventStore" && cd ../core_eventstore && git push origin master; \
	echo "core_readStoreRepository" && cd ../core_readstorerepository &&  git push origin master; \
	echo "core_logger" && cd ../core_logger && git push origin master; cd ../

comAndPushMF: comMF pushMF

comAndPushCore: comCore pushCore

rmWorkflows:
	docker stop mfbuildfiles_workflows_1 && docker rm mfbuildfiles_workflows_1 && docker rmi mfbuildfiles_workflows

rmApi:
	docker stop mfbuildfiles_api_1 && docker rm mfbuildfiles_api_1 && docker rmi mfbuildfiles_api

rmPostgres:
	docker stop mfbuildfiles_postgres_1 && docker rm mfbuildfiles_postgres_1 && docker rmi postgres

rmProjections:
	docker stop mfbuildfiles_projections_1 && docker rm mfbuildfiles_projections_1 && docker rmi mfbuildfiles_projections

rmEventstore:
	docker stop mfbuildfiles_eventstore_1 && docker rm mfbuildfiles_eventstore_1 && docker rmi mfbuildfiles_eventstore

rmData:
	docker stop mfbuildfiles_datacontainer_1 && docker rm mfbuildfiles_datacontainer_1 && docker rmi mfbuildfiles_datacontainer

nodeContainer: 
	cd NodeImage && docker build -t mf/nodebox . && cd ..

stopALL:
	docker stop $$(docker ps -aq)

removeALL:
	docker stop $$(docker ps -aq) && docker rm $$(docker ps -aq)

removeImagesALL: 
	docker stop $$(docker ps -aq) && docker rm $$(docker ps -aq) && docker rmi $$(docker images -aq)

cleanProjects:
	docker rm -f mfbuildfiles_workflows_1 && docker rmi mfbuildfiles_workflows && \
	docker rm -f mfbuildfiles_api_1 && docker rmi mfbuildfiles_api && \
	docker rm -f mfbuildfiles_postgres_1 && \
	docker rm -f mfbuildfiles_projections_1 && docker rmi mfbuildfiles_projections 

deploy:
	cd ../MF_Infrastructure && gulp && \
	cd ../MF_MessageBinders && gulp && \
	cd ../MF_Domain && gulp && \
	cd ../MF_Api && gulp deploy && \
	cd ../MF_Workflows && gulp deploy && \
	cd ../MF_Projections && gulp deploy && \
	cd ..

cleanALL:
	echo "stopping containers" 
#	[ -z $(docker ps -q) ] || docker stop $$(docker ps -q)
	#docker stop $$(docker ps -q)
	echo "remove containers" 
#	[ -z $(docker ps -aq) ] || docker rm -f $$(docker ps -aq)
	docker rm -f $$(docker ps -aq)
	echo "remove images" 
#	[[ -z $$(docker images -q ) ]] || docker rmi -f $$(docker images -q )
	docker rmi -f $$(docker images -q )
	echo "move to node dir"
	cd NodeImage && docker build -t mf/nodebox .
	echo "return to buildfiles"
	cd ..

