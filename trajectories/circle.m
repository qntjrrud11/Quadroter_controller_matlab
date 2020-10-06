function [s_D] = circle(t)
% CIRCLE trajectory generator for a circle

% =================== Your code goes here ===================
% You have to set the pos, vel, acc, yaw and yawdot variables
time_tol = 12;
radius = 5;
dt = 0.0001;

    function pos = pos_from_angle(a)
        pos = [radius*cos(a); radius*sin(a); 2.5*a/(2*pi)];
    end

    function vel = get_vel(t)
        angle1 = tj_from_line(0, 2*pi, time_tol, t);
        pos1 = pos_from_angle(angle1);
        angle2 = tj_from_line(0, 2*pi, time_tol, t+dt);
        vel = (pos_from_angle(angle2) - pos1)/dt;
    end

if t > time_tol
    pos = [radius; 0; 2.5];
    vel = [0;0;0];
    acc = [0;0;0];
else
    angle = tj_from_line(0, 2*pi, time_tol, t);
    pos = pos_from_angle(angle);
    vel = get_vel(t);
    acc = (get_vel(t+dt) - get_vel(t))/dt;
end

yaw = 0;
yawdot = 0;
% =================== Your code ends here ===================

s_D.pos = pos(:);
s_D.vel = vel(:);
s_D.acc = acc(:);
s_D.ang_psi = yaw;
s_D.ome_psi = yawdot;

end