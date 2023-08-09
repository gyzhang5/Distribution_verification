function [fitresult, gof] = createFit(T, frridg1)
%CREATEFIT6(T,FRRIDG1)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : T
%      Y Output: frridg1
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 01-Nov-2018 23:27:04 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( T, frridg1 );

% Set up fittype and options.
ft = 'linearinterp';

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, 'Normalize', 'on' );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'frridg1 vs. T', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel T
% ylabel frridg1
% grid on


