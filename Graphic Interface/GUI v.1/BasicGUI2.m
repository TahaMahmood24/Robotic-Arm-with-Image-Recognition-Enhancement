function varargout = BasicGUI2(varargin)
% BASICGUI2 MATLAB code for BasicGUI2.fig
%      BASICGUI2, by itself, creates a new BASICGUI2 or raises the existing
%      singleton*.
%
%      H = BASICGUI2 returns the handle to a new BASICGUI2 or the handle to
%      the existing singleton*.
%
%      BASICGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BASICGUI2.M with the given input arguments.
%
%      BASICGUI2('Property','Value',...) creates a new BASICGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BasicGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BasicGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BasicGUI2

% Last Modified by GUIDE v2.5 26-Dec-2020 23:04:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BasicGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @BasicGUI2_OutputFcn, ...
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


% --- Executes just before BasicGUI2 is made visible.
function BasicGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BasicGUI2 (see VARARGIN)

% Choose default command line output for BasicGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global num;
num = 1;
disp('Taha is the best')
% UIWAIT makes BasicGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = BasicGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global num;
num = 1;
clc
clear all


% --- Executes on slider movement.
function slider_Callback(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'value');
set(handles.length,'string',num2str(value));
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.length,'string');
sliderValues = str2num(sliderValue)
if (isempty(sliderValues) || sliderValues < 0 || sliderValues > 0.30)
    set(handles.slider,'Value',0);
    set(handles.length,'String',0);
else
    set(handles.slider,'Value',sliderValues);
end
%set(handles.slider,'values',str2num(edit));
%guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of length as text
%        str2double(get(hObject,'String')) returns contents of length as a double


% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in X_plus.
function X_plus_Callback(hObject, eventdata, handles)
    global T
    direction = 'x';
    increment = get(handles.length,'string');
    increment2 = str2num(increment)
    T_initial = T;
    T_final = tmove(direction,increment2,T_initial);
    for motor_number = 1:6
        initial_angle = T_initial(motor_number)*57.30;
        final_angle = T_final(motor_number)*57.30;
        motor(motor_number,final_angle,initial_angle);
    end
    T = T_final;
    mdl_puma560
    p560.fkine(T_2)
    disp('Called X+')
%disp(b)
% hObject    handle to X_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in X_minus.
function X_minus_Callback(hObject, eventdata, handles)
    global T
    direction = 'x';
    increment = get(handles.length,'string');
    increment2 = str2num(increment)
    T_initial = T;
    T_final = tmove(direction,-increment2,T_initial);
    for motor_number = 1:6
        initial_angle = T_initial(motor_number)*57.30;
        final_angle = T_final(motor_number)*57.30;
        motor(motor_number,final_angle,initial_angle);
    end
    T = T_final;
    mdl_puma560
    p560.fkine(T)
    disp('Called X-')
% hObject    handle to X_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Z_minus.
function Z_minus_Callback(hObject, eventdata, handles)
% hObject    handle to Z_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global T
    direction = 'z';
    increment = get(handles.length,'string');
    increment2 = str2num(increment)
    T_initial = T;
    T_final = tmove(direction,-increment2,T_initial);
    for motor_number = 1:6
        initial_angle = T_initial(motor_number)*57.30;
        final_angle = T_final(motor_number)*57.30;
        motor(motor_number,final_angle,initial_angle);
    end
    T = T_final;
    mdl_puma560
    p560.fkine(T)
    disp('Called Z-')


% --- Executes on button press in Y_minus.
function Y_minus_Callback(hObject, eventdata, handles)
% hObject    handle to Y_minus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global T
    direction = 'y';
    increment = get(handles.length,'string');
    increment2 = str2num(increment)
    T_initial = T;
    T_final = tmove(direction,-increment2,T_initial);
    for motor_number = 1:6
        initial_angle = T_initial(motor_number)*57.30;
        final_angle = T_final(motor_number)*57.30;
        motor(motor_number,final_angle,initial_angle);
    end
    T = T_final;
    mdl_puma560
    p560.fkine(T)
    disp('Called Y-')


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T;
T = zeros(1,6);
disp(T)


% --- Executes on button press in Y_plus.
function Y_plus_Callback(hObject, eventdata, handles)
% hObject    handle to Y_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global T
    direction = 'y';
    increment = get(handles.length,'string');
    increment2 = str2num(increment)
    T_initial = T;
    T_final = tmove(direction,increment2,T_initial);
    for motor_number = 1:6
        initial_angle = T_initial(motor_number)*57.30;
        final_angle = T_final(motor_number)*57.30;
        motor(motor_number,final_angle,initial_angle);
    end
    T = T_final;
    mdl_puma560
    p560.fkine(T)
    disp('Called Y+')


% --- Executes on button press in Z_plus.
function Z_plus_Callback(hObject, eventdata, handles)
% hObject    handle to Z_plus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global T;
    T_initial = T;
    direction = 'z';
    increment = get(handles.length,'string');
    increment2 = str2num(increment)
    T_final = tmove(direction,increment2,T_initial);
    for motor_number = 1:6
        initial_angle = T_initial(motor_number)*57.30;
        final_angle = T_final(motor_number)*57.30;
        motor(motor_number,final_position,initial_position);
    end
    T = T_final;


% --- Executes on button press in Rotate_Zminus.
function Rotate_Zminus_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_Zminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global T;
    direction = 'z';
    increment = get(handles.Angle,'string');
    disp(increment);
    increment2 = str2num(increment)
    class(increment2);
    position_angles = [0 0 0 0 0 0];
    T = rmove(direction,-increment2,T)
    mdl_puma560
    p560.fkine(T)
    disp('Called Z+')



% --- Executes on button press in Reset_2.
function Reset_2_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject,'value');
set(handles.Angle,'string',num2str(value));
guidata(hObject,handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function Angle_Callback(hObject, eventdata, handles)
% hObject    handle to Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sliderValue = get(handles.Angle,'string');
sliderValues = str2num(sliderValue)
if (isempty(sliderValues) || sliderValues < 0 || sliderValues > 30)
    set(handles.slider2,'Value',0);
    set(handles.Angle,'String',0);
else
    set(handles.slider2,'Value',sliderValues);
end
% Hints: get(hObject,'String') returns contents of Angle as text
%        str2double(get(hObject,'String')) returns contents of Angle as a double


% --- Executes during object creation, after setting all properties.
function Angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rotate_Yminus.
function rotate_Yminus_Callback(hObject, eventdata, handles)
% hObject    handle to rotate_Yminus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global T;
    direction = 'y';
    increment = get(handles.Angle,'string');
    disp(increment);
    increment2 = str2num(increment)
    class(increment2);
    position_angles = [0 0 0 0 0 0];
    T = rmove(direction,-increment2,T)
    mdl_puma560
    p560.fkine(T)
    disp('Called Z+')


% --- Executes on button press in Rotate_Zplus.
function Rotate_Zplus_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_Zplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global T;
    direction = 'z';
    increment = get(handles.Angle,'string');
    disp(increment);
    increment2 = str2num(increment)
    class(increment2);
    position_angles = [0 0 0 0 0 0];
    T = rmove(direction,increment2,T)
    mdl_puma560
    p560.fkine(T)
    disp('Called Z+')


% --- Executes on button press in Rotate_Yplus.
function Rotate_Yplus_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate_Yplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global T;
    direction = 'y';
    increment = get(handles.Angle,'string');
    disp(increment);
    increment2 = str2num(increment)
    class(increment2);
    position_angles = [0 0 0 0 0 0];
    T = rmove(direction,increment2,T)
    mdl_puma560
    p560.fkine(T)
    disp('Called Z+')


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
