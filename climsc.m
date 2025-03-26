classdef climsc
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        inputValue (1,2) double
        scaleMode (1,1) string %{mustBeMember(scaleMode,{"Robust","Standard","Minmax"})}
        scaledValue (1,2) double       
    end

    methods
        function obj = climsc(inputValue)         
            obj.inputValue = inputValue;
        end
        function Robust(obj)            
            obj.scaleMode = "Robust";
            [ax,img,dt] = obj.auto_target();
            obj.scaledValue = obj.inputValue*iqr(dt) + median(dt);
            % clim(ax,obj.scaledValue);
            ax.CLim = obj.scaledValue;
        end
        function Standard(obj)
            obj.scaleMode = "Standard";
            [ax,img,dt] = obj.auto_target();
            obj.scaledValue = obj.inputValue*std(dt) + mean(dt);
            clim(ax,obj.scaledValue);
        end
        function Minmax(obj)
            obj.scaleMode = "Minmax";
            [ax,img,dt] = obj.auto_target();
            obj.scaledValue = obj.inputValue*(max(dt)-min(dt)) + min(dt);
            clim(ax,obj.scaledValue);         
        end
    end
    methods (Hidden,Static)
        function [ax,img,dt] = auto_target()
            ax = gca();
            img = findobj(ax,'type','image');
            try
                img = img(1);
            end
            dt = img.CData;
            dt = dt(:);
        end
    end
end