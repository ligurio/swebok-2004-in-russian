MAKRDOWN_FILES += 0_introduction.markdown
MAKRDOWN_FILES += 1_software_requirements.markdown
MAKRDOWN_FILES += 2_software_design.markdown
MAKRDOWN_FILES += 3_software_construction.markdown
MAKRDOWN_FILES += 4_software_testing.markdown
MAKRDOWN_FILES += 5_software_maintenance.markdown
MAKRDOWN_FILES += 6_software_configuration_management.markdown
MAKRDOWN_FILES += 7_software_engineering_management.markdown
MAKRDOWN_FILES += 8_software_engineering_process.markdown
MAKRDOWN_FILES += 9_software_engineering_tools_and_methods.markdown
MAKRDOWN_FILES += 10_software_quality.markdown
MAKRDOWN_FILES += software_lifecycle_models.markdown
MAKRDOWN_FILES += bibliography.markdown

PANDOC = pandoc
PANDOC_OPT += --toc
PANDOC_OPT += title.txt $(MAKRDOWN_FILES)

NAME = swebok_2004_ru

all: $(NAME).html $(NAME).epub $(NAME).fb2

$(NAME).epub: $(MAKRDOWN_FILES) title.txt
	$(PANDOC) $(PANDOC_OPT) -o $(NAME).epub

$(NAME).fb2: $(MAKRDOWN_FILES) title.txt
	$(PANDOC) $(PANDOC_OPT) -o $(NAME).fb2

$(NAME).html: $(MAKRDOWN_FILES)
	$(PANDOC) $(PANDOC_OPT) --embed-resources --standalone -o $(NAME).html

$(NAME).zip: $(NAME).html images
	zip -r $(NAME).zip $< images

release: $(NAME).epub $(name).fb2 $(NAME).zip

clean:
	rm -f $(NAME).html $(NAME).epub $(NAME).fb2 $(NAME).zip

.PHONY: clean
