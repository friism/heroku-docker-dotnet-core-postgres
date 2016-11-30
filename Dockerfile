FROM microsoft/dotnet:1.1-sdk-projectjson

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1

RUN mkdir app
WORKDIR app

ENV NUGET_PACKAGES=/nuget

ADD project.json .
RUN dotnet restore

ADD . .
RUN dotnet build


CMD ASPNETCORE_URLS=http://0.0.0.0:$PORT dotnet run
