function [ dataNew , dataOld ] = getDataFromPacket( packet ,chunckSize)
      dataOld = packet(1,4:(4+chunckSize));
      offset = 3+chunckSize+1+26+1+1;
      dataNew = packet(1,(offset+1):(offset+1+chunckSize));
end

