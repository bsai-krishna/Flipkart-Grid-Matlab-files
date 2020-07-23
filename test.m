clear all
close all
clc
vrep=remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
if (clientID>-1)
    disp('conected to remote Api');
joint_pos1=[-2*pi/3,0,0,0,pi/4,0];
joint_pos2=[0,-pi/4,pi/2,0,0,0];
joint_pos3=[-2*pi/3,0,0,0,pi/4,0];
%joint handles
h=[0,0,0,0,0,0]
[r,h(1)]=vrep.simxGetObjectHandle(clientID,'rotary_head',vrep.simx_opmode_blocking);
[r,h(2)]=vrep.simxGetObjectHandle(clientID,'lower_arm',vrep.simx_opmode_blocking);
[r,h(3)]=vrep.simxGetObjectHandle(clientID,'upper_arm',vrep.simx_opmode_blocking);
[r,h(4)]=vrep.simxGetObjectHandle(clientID,'forearm_twisting',vrep.simx_opmode_blocking);
[r,h(5)]=vrep.simxGetObjectHandle(clientID,'wrist',vrep.simx_opmode_blocking);
[r,h(6)]=vrep.simxGetObjectHandle(clientID,'axis6',vrep.simx_opmode_blocking);


while true
    for i=1:6
    vrep.simxSetJointPosition(clientID,h(1),joint_pos1(1),vrep.simx_opmode_streaming);
    end
    pause(10);
    
    for i=1:6
    vrep.simxSetJointPosition(clientID,h(1),joint_pos1(1),vrep.simx_opmode_streaming);
    end
    pause(10);
    
    for i=1:6
    vrep.simxSetJointPosition(clientID,h(1),joint_pos2(1),vrep.simx_opmode_streaming);
    end
    pause(10);
    
    for i=1:6
    vrep.simxSetJointPosition(clientID,h(1),joint_pos3(1),vrep.simx_opmode_streaming);
    end
    pause(10);
    
    
end
else
    disp('program ended');
end
    vrep.delete();
    display('Program ended')
