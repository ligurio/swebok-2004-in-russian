MAKRDOWN_FILES  = title.txt
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
EPUB = swebook.epub

epub: $(MAKRDOWN_FILES)
	$(PANDOC) $(MAKRDOWN_FILES) -o $(EPUB)
