function varargout = search(varargin)
% SEARCH MATLAB code for search.fig
%      SEARCH, by itself, creates a new SEARCH or raises the existing
%      singleton*.
%
%      H = SEARCH returns the handle to a new SEARCH or the handle to
%      the existing singleton*.
%
%      SEARCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEARCH.M with the given input arguments.
%
%      SEARCH('Property','Value',...) creates a new SEARCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before search_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to search_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to m_run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help search

% Last Modified by GUIDE v2.5 05-Jan-2014 22:22:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @search_OpeningFcn, ...
                   'gui_OutputFcn',  @search_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before search is made visible.
function search_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to search (see VARARGIN)

% Choose default command line output for search
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes search wait for user response (see UIRESUME)
% uiwait(handles.figure_search);


% --- Outputs from this function are returned to the command line.
function varargout = search_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

setappdata(handles.figure_search,'img',0);

% --------------------------------------------------------------------
function m_file_Callback(hObject, eventdata, handles)
% hObject    handle to m_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------

function m_file_open_Callback(hObject, eventdata, handles)
global ljwindex ;
[filename, pathname] = uigetfile( ...
{'*.bmp;*.jpg;*.png;*.jpeg', 'Image Files (*.bmp, *.jpg, *.png,*.jpeg)'; ...
'*.*', 'All Files (*.*)'}, ...
'Pick an image');
global picstart;
picstart = 0;
set(findall(handles.axes1),'visible','off');
set(findall(handles.axes2),'visible','off');
set(findall(handles.axes3),'visible','off');
set(findall(handles.axes4),'visible','off');
set(findall(handles.axes5),'visible','off');
set(findall(handles.axes6),'visible','off');
set(findall(handles.axes7),'visible','off');
set(findall(handles.axes8),'visible','off');
set(findall(handles.axes9),'visible','off');
set(findall(handles.axes10),'visible','off');
set(findall(handles.axes11),'visible','off');
set(findall(handles.axes12),'visible','off');
set(findall(handles.axes13),'visible','off');
set(findall(handles.axes14),'visible','off');
set(findall(handles.axes15),'visible','off');
set(findall(handles.axes16),'visible','off');
set(findall(handles.axes17),'visible','off');
set(findall(handles.axes18),'visible','off');
set(findall(handles.axes19),'visible','off');
set(findall(handles.axes20),'visible','off');
set(findall(handles.axes21),'visible','off');
set(findall(handles.axes22),'visible','off');
set(findall(handles.axes23),'visible','off');
set(findall(handles.axes24),'visible','off');

axes(handles.axes0);
fpath=[pathname filename];
img = imread(fpath);
imshow(img);
setappdata(handles.figure_search,'img',img);
ljwindex = SearchOneImageIndexNew( fpath );
 

% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure_search);


% --------------------------------------------------------------------
function m_run_Callback(hObject, eventdata, handles)
% hObject    handle to m_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_run_run_Callback(hObject, eventdata, handles)
% hObject    handle to m_run_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ljwindex ;
global picstart ;
set(findall(handles.axes0),'visible','off');
axes(handles.axes1);
img = imread(ljwindex{ picstart + 1 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes2);
img = imread(ljwindex{ picstart + 2 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes3);
img = imread(ljwindex{ picstart + 3 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes4);
img = imread(ljwindex{ picstart + 4 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes5);
img = imread(ljwindex{ picstart + 5 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes6);
img = imread(ljwindex{ picstart + 6 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes7);
img = imread(ljwindex{ picstart + 7 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes8);
img = imread(ljwindex{ picstart + 8 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes9);
img = imread(ljwindex{ picstart + 9 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes10);
img = imread(ljwindex{ picstart + 10 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes11);
img = imread(ljwindex{ picstart + 11 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes12);
img = imread(ljwindex{ picstart + 12 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes13);
img = imread(ljwindex{ picstart + 13 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes14);
img = imread(ljwindex{ picstart + 14 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes15);
img = imread(ljwindex{ picstart + 15 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes16);
img = imread(ljwindex{ picstart + 16 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes17);
img = imread(ljwindex{ picstart + 17 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes18);
img = imread(ljwindex{ picstart + 18 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes19);
img = imread(ljwindex{ picstart + 19 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes20);
img = imread(ljwindex{ picstart + 20 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes21);
img = imread(ljwindex{ picstart + 21 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes22);
img = imread(ljwindex{ picstart + 22 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes23);
img = imread(ljwindex{ picstart + 23 } );
imshow(img);
setappdata(handles.figure_search,'img',img);
axes(handles.axes24);
img = imread(ljwindex{ picstart + 24 } );
imshow(img);
setappdata(handles.figure_search,'img',img);


% --------------------------------------------------------------------
function m_view_Callback(hObject, eventdata, handles)
% hObject    handle to m_view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_view_next_Callback(hObject, eventdata, handles)
global picstart;
if picstart < 100
picstart = picstart + 24;
m_run_run_Callback(hObject, eventdata, handles);
end
% hObject    handle to m_view_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_view_pre_Callback(hObject, eventdata, handles)
global picstart;
if picstart >= 24
picstart = picstart - 24;
m_run_run_Callback(hObject, eventdata, handles);
end
% hObject    handle to m_view_pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
