up:
	docker-compose pull
	docker-compose up -d
copy-hive-conf:
	docker cp ./hive-site.xml spark-master:/spark/conf
	docker restart spark-master
	docker cp ./hive-site.xml spark-worker-1:/spark/conf
	docker cp ./hive-site.xml spark-worker-2:/spark/conf
	docker restart spark-worker-1
	docker restart spark-worker-2
start: up copy-hive-conf
	echo 'spark cluster started!'