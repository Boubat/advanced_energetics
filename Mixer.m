classdef Mixer
    % flow1     : first input flow
    % flow2     : second input flow
    % flowOut   : output flow
    
    properties
        flow1
        flow2
        flowOut
    end
    
    methods
        function obj = Mixer(flow1,flow2)
            obj.flow1 = flow1;
            obj.flow2 = flow2;
            obj.flowOut = mix(flow1,flow2);
        end
    end
    
    end

function flowOut = mix(flow1,flow2)
    flow1.t = flow1.t+273;
    flow2.t = flow2.t+273;
    
    flowOut.m = flow1.m+flow2.m;
    flowOut.cp = (flow1.m*flow1.cp+flow2.m*flow2.cp)/flowOut.m;
    flowOut.t = (flow2.cp*flow2.m*flow2.t+flow1.cp*flow1.m*flow1.t)/(flow2.cp*flow2.m+flow1.cp*flow1.m)-273;
end
