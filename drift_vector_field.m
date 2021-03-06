%% drift_vector_field.m
%
% Description:
%   Wrapper function for autogen_drift_vector_field.m
%   Computes the drift vector field for the nonlinear state-space
%   dynamics of the cart-pendulum robot.
%
% Inputs:
%   x: the state vector, x = [x_cart; theta_pend; dx_cart; dtheta_pend];
%   params: a struct with many elements, generated by calling init_params.m
%
% Outputs:
%   f_ss: a 4x1 vector that maps state x to dx (time derivative of
%       the state x) when control input u = 0.

function f_ss = drift_vector_field(x,params)

% Note: x_cart does not appear in the drift vector field
theta_pend = x(2);
dx_cart = x(3);
dtheta_pend = x(4);

f_ss = autogen_drift_vector_field(params.model.dyn.pend.I,...
                                  params.model.dyn.b1,...
                                  params.model.dyn.b2,...
                                  dtheta_pend,...
                                  dx_cart,...
                                  params.model.dyn.g,...
                                  params.model.dyn.cart.m,...
                                  params.model.dyn.pend.m,...
                                  params.model.dyn.pend.r_com,...
                                  theta_pend);
end