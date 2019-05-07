library(tidyverse)
library(spagi)
hoang <- readxl::read_excel("data-raw/Hoang_Expressed.xlsx", sheet = 1) %>%
  select(1:4) %>%
  janitor::clean_names()


processed_data <- hoang %>%
  select(1:3) %>%
  as.data.frame() %>%
  `rownames<-`(.$gene_symbol) %>%
  select(-gene_symbol) %>%
  as.matrix() %>%
  preprocess_querydata(exp.cutoff.th = 1.8)

preprocess_querydata(ROR1.data, exp.cutoff.th = 1.8) %>% str()

spagi::identify_active_pathway_path(pathway.path = pathway.path, processed.query.data = processed_data)



# Protein Reference -------------------------------------------------------
Receptors <- readxl::read_excel("data-raw/RKT_Reference.xlsx", sheet = 1)$Receptors
Kinases <- readxl::read_excel("data-raw/RKT_Reference.xlsx", sheet = 2)$Kinases
TFs <- readxl::read_excel("data-raw/RKT_Reference.xlsx", sheet = 3)$TFs

# After this use the get ppi functions for mice and humanas.
# Then run generate pathway path with the ppis generated
# Throw aa browser in there to see whaat is happening.
# There should be aa physical maximum of Receptors*TFs

