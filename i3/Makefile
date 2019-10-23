hostname := $(shell hostname)

desktop_name := master-precious
laptop_name := lord-precious
work_name := marston

config: config.all config.desktop config.laptop config.work
ifeq ($(hostname),$(desktop_name))
	cat config.all config.desktop > config
else ifeq ($(hostname),$(laptop_name))
	cat config.all config.laptop > config
else ifeq ($(hostname),$(work_name))
	cat config.all config.work > config
else
	cat config.all config.work > config # Generic, assume work?
endif

clean:
	rm -f config

.PHONY: clean
