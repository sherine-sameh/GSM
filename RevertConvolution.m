function [ block ] = RevertConvolution( block )
    constlength = 9;
    traceback = 5 * constlength;
    polynomial = [657 435];
    trellis = poly2trellis(constlength,polynomial);
    block = vitdec(block,trellis,traceback,'trunc','hard');
end

