
    local Players, Uis, RService, SGui = game:GetService"Players", game:GetService"UserInputService", game:GetService"RunService", game:GetService"StarterGui";
    local Client, Mouse, Camera, CF, RNew, Vec3, Vec2 = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), workspace.CurrentCamera, CFrame.new, Ray.new, Vector3.new, Vector2.new;
    local Aimlock, MousePressed, CanNotify = true, false, false;
    local AimlockTarget;
    local OldPre;
    
    
    RService.RenderStepped:Connect(function()
        if getgenv().SmoothCamlock.ThirdPerson == true and getgenv().SmoothCamlock.FirstPerson == true then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().SmoothCamlock.ThirdPerson == true and getgenv().SmoothCamlock.FirstPerson == false then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().SmoothCamlock.ThirdPerson == false and getgenv().SmoothCamlock.FirstPerson == true then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        end
        if getgenv().SmoothCamlock.LoadCamLock == true then 
            if getgenv().globalTarget and getgenv().globalPart then 
                if getgenv().SmoothCamlock.FirstPerson == true then
                    if CanNotify == true then
                        if getgenv().SmoothCamlock.PredictMovement == true then
                            if getgenv().SmoothCamlock.Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, getgenv().globalTarget.Character[getgenv().globalPart].Position + getgenv().globalTarget.Character[getgenv().globalPart].Velocity/getgenv().SmoothCamlock.PredictMovement)
                                
                                --// Making it work \\--
                                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothCamlock.SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, getgenv().globalTarget.Character[getgenv().globalPart].Position + getgenv().globalTarget.Character[getgenv().globalPart].Velocity/getgenv().SmoothCamlock.PredictMovement)
                            end
                        elseif getgenv().SmoothCamlock.PredictMovement == false then 
                            if getgenv().SmoothCamlock.Smoothness == true then
                                --// The part we're going to lerp/smoothen \\--
                                local Main = CF(Camera.CFrame.p, getgenv().globalTarget.Character[getgenv().globalPart].Position)

                                --// Making it work \\--
                                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothCamlock.SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, getgenv().globalTarget.Character[getgenv().globalPart].Position)
                            end
                        end
                    end
                end
            end
        end
end)
