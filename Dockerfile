FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# install chocolatey
RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
RUN choco install openjdk11 -y

WORKDIR "/perfcounters"

ADD ["https://github.com/microsoft/ApplicationInsights-Java/releases/download/3.1.1/applicationinsights-agent-3.1.1.jar", "."]
#ADD ["https://github.com/microsoft/ApplicationInsights-Java/releases/download/3.2.8/applicationinsights-agent-3.2.8.jar", "."]

COPY ["App", "App"]
RUN ["javac.exe", "App/App.java"]

# put your real key here
ENV APPLICATIONINSIGHTS_CONNECTION_STRING=InstrumentationKey=0000-000

#CMD ["java.exe", "-javaagent:applicationinsights-agent-3.2.8.jar", "App/App"]
CMD ["java.exe", "-javaagent:applicationinsights-agent-3.1.1.jar", "App/App"]