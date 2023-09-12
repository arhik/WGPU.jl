# Default Backend for each platform is selected
# For now native platform are considered
# Web platforms should also be consider # TODO

abstract type WGPUAbstractBackend end

function getDefaultBackend()
    if Sys.isapple()
        return WGPUBackendType_Metal
    elseif Sys.iswindows()
        return WGPUBackendType_Vulkan
    elseif Sys.islinux()
        return WGPUBackendType_Vulkan
    end
end

mutable struct WGPUBackend <: WGPUAbstractBackend
    adapter::Ref{WGPUAdapter}
    device::Ref{WGPUDevice}
end

