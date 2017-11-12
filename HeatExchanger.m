classdef HeatExchanger
    % flowIn    : input flow
    % flowOut   : output flow
    % q         : heat exchanged [kW]
    % tTarget   : targeted temperature [�C]
    
    properties
        flowIn
        flowOut
        q              % heat exchanged [kW]
        tTarget        % targeted temperature [�C]
    end
    
    methods
        function obj = HeatExchanger(flowIn,tTarget)
            obj.flowIn = flowIn;
            obj.flowOut = flowIn;
            obj.flowOut.t = tTarget;
            obj.q = heatExchanged(flowIn,tTarget);
            obj.tTarget = tTarget;
        end
        function obj = setTarget(obj,tTarget)
            obj.flowOut.t = tTarget;
            obj.tTarget = tTarget;
            obj.q = heatExchanged(obj.flowIn,tTarget);
        end
    end
    
end

function q = heatExchanged(flow,tOut)
    q = flow.m*flow.cp*(tOut-flow.t);
end