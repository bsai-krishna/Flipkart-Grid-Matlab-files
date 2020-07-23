function moveL(clientID,target,pos,speed)
vrep=remApi('remoteApi');
[r,p]=vrep.simxGetObjectPosition(clientID,-1,vrep.simx_opmode_blocking);

[r,p]=vrep.simxGetObjectPosition(clientID,-1,vrep.simx_opmode_blocking);
[r,o]=vrep.simxGetObjectPosition(clientID,-1,vrep.simx_opmode_blocking);
for i=1:3
  if ((abs(pos(i+3)-o(i)))&&(o(i)<0))
      o(i)=o(i)+2*pi;
  elseif ((abs(pos(i+3)-o(i))>pi)&&(o(i)<0))
      o(i)=o(i)-2*pi;
  end
end
old_pos[p o];
delta_pos = pos - ols_pos;
distance =norm(delta_pos);
samples_number=round(diatance*50);
for i=1:sample_number;
    intermediate_pos= old_pos + (delata_pos/samples_number);
    
    tic;
    while(toc < (distance/(speed*samples_number)))
    end
    vrep.simxSetObjectPosition(clientID,target,-1,intermediate_pos,vrep.simx_opmode_blocking);
    vrep.simxSetObjectPosition(clientID,target,-1,intermediate_pos(4:6),vrep.simx_opmode_blocking);
    old_pos=intermediate_pos
end