.PHONY : server build optimize clean unit.test

brunchPath=node_modules/.bin/brunch

define allowBreak
	trap 'exitprocess' 2;\
	function exitprocess() { exit 127; };
endef

server : clean
	@echo "开始监视目录变动..."
	@$(allowBreak)\
	DEBUG=brunch:* $(brunchPath) watch --server;\
	if [ $$? -ne 0 -a $$? -ne 127 ]; then\
		echo "启动失败，正在重新开始...";\
		make server;\
	fi;

build : clean
	@echo "开始构建项目文件..."
	@$(allowBreak)\
	DEBUG=brunch:* $(brunchPath) build;\
	if [ $$? -ne 0 -a $$? -ne 127 ]; then\
		make build;\
	fi;

optimize : clean
	@echo "开始构建并压缩项目文件..."
	@$(allowBreak)\
	$(brunchPath) build --env production;\
	if [ $$? -ne 0 -a $$? -ne 127 ]; then\
		make optimize;\
	fi;

clean :
	@echo "开始清理目录..."
	@-rm -rf public

test.unit :
	@node_modules/.bin/karma start test/test.unit.conf.coffee

