function varargout = webcam_gui(varargin)
% WEBCAM_GUI MATLAB code for webcam_gui.fig
%      WEBCAM_GUI, by itself, creates a new WEBCAM_GUI or raises the existing
%      singleton*.
%
%      H = WEBCAM_GUI returns the handle to a new WEBCAM_GUI or the handle to
%      the existing singleton*.
%
%      WEBCAM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WEBCAM_GUI.M with the given input arguments.
%
%      WEBCAM_GUI('Property','Value',...) creates a new WEBCAM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before webcam_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to webcam_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help webcam_gui

% Last Modified by GUIDE v2.5 21-Mar-2021 01:13:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @webcam_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @webcam_gui_OutputFcn, ...
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


% --- Executes just before webcam_gui is made visible.
function webcam_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to webcam_gui (see VARARGIN)
imaqreset;

handles.hCamera = webcam;
% Choose default command line output for webcam_gui
handles.output = hObject;

set(handles.axes1,'xtick',[])
set(handles.axes1,'ytick',[])

handles.ref_vid_img = snapshot(handles.hCamera);

imshow(handles.ref_vid_img, 'Parent', handles.axes1)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes webcam_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = webcam_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = arduino('COM4','Uno')
while 1
    vid_img = snapshot(handles.hCamera);
    position = [23 50];
    value = readVoltage(a,'A0')
    if value <= 0.100
        box_color = {'red'};
    else
        box_color = {'green'};
    end;
    RGB = insertText(vid_img,position,'Taha Mahmood','FontSize',18,'BoxColor',box_color,'BoxOpacity',0.4,'TextColor','white');
    imshow(RGB, 'Parent', handles.axes1);
end;
    
