local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("svrestart", "Sunucu Yeniden Başlatılıyor", {}, false, function(source, args)
    print("svrestart command executed")
    if source == 0 then
        local reason = args[1] ~= nil and table.concat(args, " ") or "Sunucu Yeniden Başlatılıyor..."
        local players = GetPlayers()
        print("Oyuncu Sayisi:", #players)

        -- Send notifications at intervals
        Citizen.CreateThread(function()
            print("Bildirim başlatıldı")
            for _, player in ipairs(players) do
                print("Ilk Uyariyi atim", player)
                QBCore.Functions.Notify(player, "Sunucu 3 dakika içinde yeniden başlatılacak. Lütfen rollerinizi bırakın ve sunucudan çıkın!", "warning")
            end
            print("1 Dakika Bekliyorum...")
            Wait(60000) -- 1 minute

            for _, player in ipairs(players) do
                print("Ikinci Uyariyi atim", player)
                QBCore.Functions.Notify(player, "Sunucu 2 dakika içinde yeniden başlatılacak. Lütfen rollerinizi bırakın ve sunucudan çıkın!", "warning")
            end
            print("1 Dakika Bekliyorum...")
            Wait(60000) -- 1 minute

            for _, player in ipairs(players) do
                print("Ucuncu Uyariyi atim", player)
                QBCore.Functions.Notify(player, "Sunucu 1 dakika içinde yeniden başlatılacak. Lütfen rollerinizi bırakın ve sunucudan çıkın!", "warning")
            end
            print("1 Dakika Bekliyorum...")
            Wait(60000) -- 1 minute

            for _, player in ipairs(players) do
                print("Son Uyariyi atim", player)
                QBCore.Functions.Notify(player, "Sunucu yeniden başlatılıyor.", "warning")
            end
            print("1 Sanye Bekliyorum..")
            Wait(1000) -- 1 second

            -- Save player data and kick players
            for _, player in ipairs(players) do
                print("Oyuncu Verisni Kaydediyorum", player)
                local pData = QBCore.Functions.GetPlayer(player)
                if pData then
                    pData.Functions.Save()
                else
                    print("Hata: Oyuncu Icin Veri Bulamadim", player)
                end
            end
            print("1 Sanye Bekliyorum...")
            Wait(1000) -- 1 second
            for _, player in ipairs(players) do
                print("Oyunculari Atiyorum", player)
                DropPlayer(player, reason)
            end

            -- Restart the server using TXAdmin
            print("Sunucu Yeniden Başlatılıyor...")
            os.execute("txAdmin-cli restart")
        end)
    end
end, "admin", "god")

QBCore.Commands.Add("svbakim", "Sunucu Bakima Giriyor", {}, false, function(source, args)
    print("svbakim command executed")
    if source == 0 then
        local reason = args[1] ~= nil and table.concat(args, " ") or "Sunucu Bakima Giriyor..."
        local players = GetPlayers()
        print("Oyuncu Sayisi:", #players)

        -- Send notifications at intervals
        Citizen.CreateThread(function()
            print("Bildirim başlatıldı")
            for _, player in ipairs(players) do
                print("Ilk Uyariyi atim", player)
                QBCore.Functions.Notify(player, "Sunucu 3 dakika içinde bakima girecek. Lütfen rollerinizi bırakın ve sunucudan çıkın!", "warning")
            end
            print("1 Dakika Bekliyorum...")
            Wait(60000) -- 1 minute

            for _, player in ipairs(players) do
                print("Ikinci Uyariyi atim", player)
                QBCore.Functions.Notify(player, "Sunucu 2 dakika içinde bakima girecek. Lütfen rollerinizi bırakın ve sunucudan çıkın!", "warning")
            end
            print("1 Dakika Bekliyorum...")
            Wait(60000) -- 1 minute

            for _, player in ipairs(players) do
                print("Ucuncu Uyariyi atim", player)
                QBCore.Functions.Notify(player, "Sunucu 1 dakika içinde bakima girecek. Lütfen rollerinizi bırakın ve sunucudan çıkın!", "warning")
            end
            print("1 Dakika Bekliyorum...")
            Wait(60000) -- 1 minute

            for _, player in ipairs(players) do
                print("Son Uyariyi atim", player)
                QBCore.Functions.Notify(player, "Sunucu bakima Giriyor.", "warning")
            end
            print("1 Sanye Bekliyorum..")
            Wait(1000) -- 1 second

        
            -- Save player data and kick players
            for _, player in ipairs(players) do
                print("Oyuncu Verisni Kaydediyorum", player)
                local pData = QBCore.Functions.GetPlayer(player)
                if pData then
                    pData.Functions.Save()
                else
                    print("Hata: Oyuncu Icin Veri Bulamadim", player)
                end
            end
            print("1 Sanye Bekliyorum...")
            Wait(1000) -- 1 second
            for _, player in ipairs(players) do
                print("Oyunculari Atiyorum", player)
                DropPlayer(player, reason)
            end
        end)
    end
end, "admin", "god")