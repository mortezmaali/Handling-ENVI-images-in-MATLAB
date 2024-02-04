datafile = 'C:\Users\Morteza\OneDrive\Desktop\PhD\New_Data\8cal_Seurat_AFTER';
hdrfile = 'C:\Users\Morteza\OneDrive\Desktop\PhD\New_Data\8cal_Seurat_AFTER.hdr';

hcube = hypercube(datafile,hdrfile);
img = im2double(hcube.DataCube);
[m n l] = size(img);
%Simple visualization
viz1 = zeros(m,n,3);
viz1(:,:,1) = img(:,:,100);
viz1(:,:,2) = img(:,:,70);
viz1(:,:,3) = img(:,:,40);
figure(1);imshow(viz1)
%colorimetric visualization
Accessories;
img2 = img(:,:,1:120);
img2 = reshape(img2,[m*n 120]);
x = 400:5:700;
xq = hcube.Wavelength(1:120);
v = D65;
vq = interp1(x,v,xq);
D65n = vq;
v = xyz;
vq = interp1(x,v,xq);
xyzn = vq;

[XYZ]=ref2XYZ(img2',xyzn,D65n);
image_col = xyz2srgb(XYZ);
image_col = reshape(image_col',[m n 3]);
figure(2);imshow(image_col,[])