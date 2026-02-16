-- CONFIGURACIÓN DEL SISTEMA CON TU WEB
local player = game.Players.LocalPlayer
local userId = player.UserId
local fecha = os.date("%d%m") -- Sincronizado con tu index.html (Día y Mes)

-- LA FÓRMULA (ID + FECHA)
local operacion = (userId + tonumber(fecha))
local keyCorrecta = "BR-" .. tostring(operacion)

-- TU ENLACE DE GITHUB PAGES
local miWebKey = "https://reyesisamar455-svg.github.io/brainrot-key/"

-- 1. INTERFAZ GRÁFICA (GUI)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Main = Instance.new("Frame", ScreenGui)
local Title = Instance.new("TextLabel", Main)
local Input = Instance.new("TextBox", Main)
local VerifyBtn = Instance.new("TextButton", Main)
local GetKeyBtn = Instance.new("TextButton", Main)

-- Estilo Visual
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -110, 0.5, -85)
Main.Size = UDim2.new(0, 220, 0, 170)
Main.Active = true
Main.Draggable = true

Title.Text = "BRAINROT SYSTEM"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.fromRGB(0, 255, 150)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold

Input.PlaceholderText = "Pega tu Key personal..."
Input.Position = UDim2.new(0.1, 0, 0.35, 0)
Input.Size = UDim2.new(0.8, 0, 0, 35)
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.TextColor3 = Color3.white

VerifyBtn.Text = "VERIFICAR"
VerifyBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 35)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
VerifyBtn.TextColor3 = Color3.white

GetKeyBtn.Text = "OBTENER KEY (CLIC)"
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.88, 0)
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 15)
GetKeyBtn.BackgroundTransparency = 1
GetKeyBtn.TextColor3 = Color3.fromRGB(100, 150, 255)
GetKeyBtn.TextSize = 10

-- 2. FUNCIÓN DE SUPERVIVENCIA (LO QUE SE DESBLOQUEA)
local function ActivarHack()
    -- Elimina sensores de daño del Tsunami
    local function limpiar(instancia)
        for _, v in ipairs(instancia:GetDescendants()) do
            if v:IsA("TouchTransmitter") then v:Destroy() end
        end
    end
    workspace.ChildAdded:Connect(function(obj) task.wait(0.1); limpiar(obj) end)
    limpiar(workspace)
    
    -- Notificación de éxito
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ACCESO TOTAL",
        Text = "Modo Dios Activado",
        Duration = 5
    })
    ScreenGui:Destroy()
end

-- 3. LÓGICA DE LOS BOTONES
VerifyBtn.MouseButton1Click:Connect(function()
    if Input.Text == keyCorrecta then
        ActivarHack()
    else
        VerifyBtn.Text = "KEY INVÁLIDA"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1)
        VerifyBtn.Text = "VERIFICAR"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    end
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(miWebKey) -- Copia tu link de GitHub
    GetKeyBtn.Text = "¡LINK COPIADO!"
    task.wait(2)
    GetKeyBtn.Text = "OBTENER KEY (CLIC)"
end)
