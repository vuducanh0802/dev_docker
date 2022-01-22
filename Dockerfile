FROM python:3.8


RUN apt-get update \
 && apt-get install -y \
      git \
      unzip \
 && rm -rf /var/lib/apt/lists/*

#Install Ricty Diminished as a font.
WORKDIR /usr/share/fonts
ENV RICTY_DIMINISHED_VERSION 3.2.4
ADD https://github.com/mzyy94/RictyDiminished-for-Powerline/archive/$RICTY_DIMINISHED_VERSION-powerline-early-2016.zip .
RUN unzip -jo $RICTY_DIMINISHED_VERSION-powerline-early-2016.zip \
 && fc-cache -fv

#Prepare a configuration file for Matplotlib.
WORKDIR /etc
RUN echo "backend : Agg" >> matplotlibrc \
 && echo "font.family : Ricty Diminished" >> matplotlibrc

#Install Matplotlib.
WORKDIR .
ENV MATPLOTLIB_VERSION 2.0.2
RUN pip install matplotlib==$MATPLOTLIB_VERSION

#Copy the sample script using Matplotlib.
COPY main.py .


# ADD main.py .

RUN pip install requests beautifulsoup4 matplotlib

CMD ["python", "main.py"]



