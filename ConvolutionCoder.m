function [ Block ] = ConvolutionCoder( Block )
    constlength = 9;
    traceback = 5 * constlength;
    polynomial = [657 435];
    trellis = poly2trellis(constlength,polynomial);
    Block = convenc(Block,trellis);
end

