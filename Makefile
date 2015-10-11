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

buildNodeContainer:
	cd NodeImage && docker build -t mf_nodebox . && cd ..

startWorkflows:
	if [ docker images | grep mf_nodebox ]; then cd NodeImage && docker build -t mf_nodebox . && cd ..; fi
	cd ../mf_workflows && make run

startnode:
	if [ docker images | grep mf_nodebox ]; then
	cd NodeImage && docker build -t mf_nodebox . && cd ..; fi

stopAllContainers:
	docker stop $$(docker ps -aq)

removeAllContainers:
	docker stop $$(docker ps -aq) && docker rm $$(docker ps -aq)

removeAllImages:
	docker stop $$(docker ps -aq) && docker rm $$(docker ps -aq) && docker rmi $$(docker images -aq)

removeAllButNode:
	docker rm -vf $$(docker ps -a -q) 2>/dev/null || echo "No more containers to remove."
	docker rmi $$(docker images | grep -v ^mf_nodebox  | awk '{print $3}' | sed -n '1!p') 2>/dev/null || echo "No more containers to remove."


