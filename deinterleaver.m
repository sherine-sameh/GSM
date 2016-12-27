function [blocks] = deinterleaver(packets,chunckSize,realSize)
    disp('start de interleaver process');
    [packets_size,code_length] = size(packets);
    if(mod(packets_size,8) ~= 0)
        disp('something wrong with packet coordination');
    end
    blocks = [];
    % here packets size must be divisible by 8
    for i = 1 : 8 : packets_size;
        total_block = [];
        for j = 1: 8 % 8 inclusive as interleaving makes it to 8 chuncks
                % each block is divided into 8 packet
                    
%                packets(j,:)
                [data dataOld] = getDataFromPacket(packets(j,:),chunckSize); % get data from each packet
                data = data';
                total_block = [total_block data]; % cat them
        end
       % disp('total block');
       % total_block
        %input('Trace ');
        %retrieve packet % init step array
        %disp('block reconstructed');
        block = reshape(total_block,1,[]);
        %disp('block real size');
        block = block(1,1:realSize);
        blocks = [blocks;block]; % create array of blocks again
   % input('Trace ');
    end
    disp('end prcess of interleaver');
end
