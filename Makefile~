NAME=mf/api

pull:
	cd MF_Api && git pull origin master && \
	cd ../MF_BuildFiles && git pull origin master && \
	cd ../MF_Core && git pull origin master && \
	cd ../MF_Domain && git pull origin master && \
	cd ../MF_FrontEnd && git pull origin master && \
	cd ../MF_Projections && git pull origin master && cd ..; 
	
comAndPush:
	cd MF_Api && git com "commit and push"; git push origin master; \
	cd ../MF_BuildFiles && git com "commit and push"; git push origin master; \
	cd ../MF_Core && git com "commit and push"; git push origin master; \
	cd ../MF_Domain && git com "commit and push"; git push origin master; \
	cd ../MF_FrontEnd && git com "commit and push"; git push origin master; \
	cd ../MF_Projections && git com "commit and push"; git push origin master; cd ..;
