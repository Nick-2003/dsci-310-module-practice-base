FROM rocker/verse:4.2.1

COPY list.sh /home/rstudio/list.sh

RUN bash /home/rstudio/list.sh

RUN Rscript -e "install.packages('remotes')" # Double quotes for command itself, single quotes for within command  && \ 
    Rscript -e "remotes::install_version('renv', version='1.0.11')" # Install renv; since install_version is the same as install.packages; renv starts over or use lock file to instlal everything with renv  && \ 
    Rscript -e "remotes::install_version('cowsay', version='1.0.0')" # Installs cowsay with specifc version; since this is here, don't need to reactivate renv within R file  && \ 
    Rscript -e "remotes::install_version('rmarkdown', version='2.29', repos='https://cloud.r-project.org')" && \ 
    Rscript -e "remotes::install_version('docopt', version='0.7.1', repos='https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('palmerpenguins', version='0.1.1', repos='https://cloud.r-project.org')" && \ 
    Rscript -e "remotes::install_version('rsample', version='1.1.1', repos='https://cloud.r-project.org')" && \ 
    Rscript -e "remotes::install_version('parsnip', version='1.1.1', repos='https://cloud.r-project.org')" && \ 
    Rscript -e "remotes::install_version('kknn', version='1.3.1', repos='https://cloud.r-project.org')" && \ 
    Rscript -e "remotes::install_version('workflows', version='1.1.4', repos='https://cloud.r-project.org')" && \ 
    Rscript -e "remotes::install_version('yardstick', version='1.2.0', repos='https://cloud.r-project.org')"

RUN R -e 'remotes::install_github("Nick-2003/regexcite20250416")' # TO BE CHANGED

# # Sample R scripts from Tutorial 4-5 and Individual Assignment 3
# COPY function.R /home/rstudio/function.R
# COPY cowsaid.R /home/rstudio/cowsaid.R
# COPY sampledoc.qmd /home/rstudio/sampledoc.qmd

# # Run the R script as rstudio user
# # Has to be formatted like this to avoid JSONArgsRecommended warning
# # This will run a RStudio instead if commented out; only 1 CMD instruction
# CMD ["Rscript", "/home/rstudio/function.R"] 
# CMD ["Rscript", "/home/rstudio/cowsaid.R"] 

# # Start RStudio Server (this keeps the container running)
# CMD ["/init"]