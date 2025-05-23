function [fitresult, gof] = createFit(x, y, n, xtitle)
%CREATEFIT(X,Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input: x
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 15-Apr-2024 16:37:47


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, y );


% Set up fittype and options.
ft = fittype(sprintf('poly%d', n ));

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
subplot(3,3,n)
h = plot( fitresult, xData, yData );
legend( h, 'data', 'best fit line', 'Location', 'SouthWest', 'Interpreter', 'none' );
% Label axes
title(sprintf('Number of Polynomials: %d', n));
xlabel(char(sprintf('R Squared : %f RMSE: %f', gof.rsquare,gof.rmse)));
ylabel( 'Energy Requested from Grid (kW)' );
sgtitle(char(sprintf('Energy Requested from the grid Vs %s', xtitle)))
grid on


