
FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY ./Tootest.Bcs.ProductManagement.Api/bin/Release/net5.0/ App/
WORKDIR /App
ENTRYPOINT ["dotnet", "Tootest.Bcs.ProductManagement.Api.dll"]