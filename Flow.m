classdef Flow
    % Flow is a class representing the state of the matter between two
    % processes.
    % m     : mass flow [kg/s]
    % cp    : specific heat [kJ/kgK]
    % t     : temperature   [�C]
    % type  : 'COLD' or 'HOT'
    
    properties
        m           % mass flow     [kg/s]
        cp          % specific heat [kJ/kgK]
        t           % temperature   [�C]
    end    
    
    methods
        function obj = Flow(m,cp,t,type)
            obj.m = m;
            obj.cp = cp;
            obj.t = t;
            if (type == 'hot') % || type == 'COLD')
                obj.type = type;
            else
                fprintf('Incorrect type value. Must be "COLD" or "HOT". For more information type "help Flow"');
            end
        end
    end
end