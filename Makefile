MAKRDOWN_FILES += 0_introduction.md
MAKRDOWN_FILES += 1_software_requirements.md
MAKRDOWN_FILES += 2_software_design.md
MAKRDOWN_FILES += 3_software_construction.md
MAKRDOWN_FILES += 4_software_testing.md
MAKRDOWN_FILES += 5_software_maintenance.md
MAKRDOWN_FILES += 6_software_configuration_management.md
MAKRDOWN_FILES += 7_software_engineering_management.md
MAKRDOWN_FILES += 8_software_engineering_process.md
MAKRDOWN_FILES += 9_software_engineering_tools_and_methods.md
MAKRDOWN_FILES += 10_software_quality.md
MAKRDOWN_FILES += software_lifecycle_models.md
MAKRDOWN_FILES += bibliography.md

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
