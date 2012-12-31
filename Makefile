all: lint stats

lint:
	@find libexec -type f -exec egrep -l '^#!/.+(bash|sh)' {} \; \
		| while read file ; do \
			echo "linting $$file" ; \
			bash -n $$file || exit 1; \
		done

stats:
	@echo && ruby contrib/stats.rb
