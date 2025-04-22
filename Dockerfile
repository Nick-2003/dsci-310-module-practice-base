FROM rocker/verse:4.2.1

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
