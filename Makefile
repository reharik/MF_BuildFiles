libs_for_gcc = -lgnu
M="commit and push"
COMPUSH := cd ../xxx && echo "xxx" && git com $(M) && git push origin master;
PULL := echo "xxx" && cd ../xxx && git pull origin master &&

pullMF:
	git pull origin master && \
	$(subst xxx,mf_api, $(PULL)) \
	$(subst xxx,mf_messagebinders, $(PULL)) \
	$(subst xxx,mf_workflows, $(PULL)) \
	$(subst xxx,mf_data, $(PULL)) \
	$(subst xxx,mf_projections, $(PULL)) \
	#$(subst xxx,MF_FrontEnd, $(PULL)) \
	cd ../mf_buildFiles;

comAndPushMF:
	echo "MF_BuildFiles"; git com $(M) && git push origin master; \
	$(subst xxx,mf_projections, $(COMPUSH)) \
	$(subst xxx,mf_domain, $(COMPUSH)) \
	$(subst xxx,mf_messagebinders, $(COMPUSH)) \
	$(subst xxx,mf_workflows, $(COMPUSH)) \
	$(subst xxx,mf_data, $(COMPUSH)) \
	#$(subst xxx,MF_FrontEnd, $(COMPUSH)) \
	cd ../mf_buildfiles;

pullCore:
	$(subst xxx,core_eventdispatcher, $(PULL)) \
	$(subst xxx,core_eventhandlerbase, $(PULL)) \
	$(subst xxx,core_eventmodels, $(PULL)) \
	$(subst xxx,core_eventrepository, $(PULL)) \
	$(subst xxx,core_eventstore, $(PULL)) \
	$(subst xxx,core_readstorerepository, $(PULL)) \
	$(subst xxx,core_logger, $(PULL)) \
	cd ..;

comAndPushCore:
	$(subst xxx,core_eventdispatcher, $(COMPUSH)) \
	$(subst xxx,core_eventhandlerbase, $(COMPUSH)) \
	$(subst xxx,core_eventmodels, $(COMPUSH)) \
	$(subst xxx,core_eventrepository, $(COMPUSH)) \
	$(subst xxx,core_eventstore, $(COMPUSH)) \
	$(subst xxx,core_readstorerepository, $(COMPUSH)) \
	$(subst xxx,core_eventdispatcher, $(COMPUSH)) \
	cd ../

buildNodeImage:
	cd NodeImage && docker build -t mf_nodebox . && cd ..

startWorkflows: buildNodeImage startData
	cd ../mf_workflows && make build && make run

startProjections: buildNodeImage
	cd ../mf_projections && make build && make run

startApi: buildNodeImage
	cd ../mf_api && make build && make run

startData: buildNodeImage startData
	cd ../mf_data && make build && make run

stopAllContainers:
	docker stop $$(docker ps -aq)

removeAllContainers:
	docker stop $$(docker ps -aq) && docker rm $$(docker ps -aq)

removeAllImages:
	docker stop $$(docker ps -aq) && docker rm $$(docker ps -aq) && docker rmi $$(docker images -aq)

removeAllButNode:
	docker rm -vf $$(docker ps -a -q) 2>/dev/null || echo "No more containers to remove."
	docker rmi $$(docker images | grep -v ^mf_nodebox  | awk '{print $3}' | sed -n '1!p') 2>/dev/null || echo "No more containers to remove."


