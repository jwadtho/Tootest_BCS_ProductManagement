#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["Tootest.Bcs.ProductManagement.Api/Tootest.Bcs.ProductManagement.Api.csproj", "Tootest.Bcs.ProductManagement.Api/"]
RUN dotnet restore "Tootest.Bcs.ProductManagement.Api/Tootest.Bcs.ProductManagement.Api.csproj"
COPY . .
WORKDIR "/src/Tootest.Bcs.ProductManagement.Api"
RUN dotnet build "Tootest.Bcs.ProductManagement.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Tootest.Bcs.ProductManagement.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Tootest.Bcs.ProductManagement.Api.dll"]
